package cn.iocoder.yudao.module.puu.controller.admin.feedbackcategory;

import org.springframework.web.bind.annotation.*;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Operation;

import jakarta.validation.constraints.*;
import jakarta.validation.*;
import jakarta.servlet.http.*;
import java.util.*;
import java.io.IOException;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

import cn.iocoder.yudao.framework.excel.core.util.ExcelUtils;

import cn.iocoder.yudao.framework.operatelog.core.annotations.OperateLog;
import static cn.iocoder.yudao.framework.operatelog.core.enums.OperateTypeEnum.*;

import cn.iocoder.yudao.module.puu.controller.admin.feedbackcategory.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcategory.FeedbackCategoryDO;
import cn.iocoder.yudao.module.puu.convert.feedbackcategory.FeedbackCategoryConvert;
import cn.iocoder.yudao.module.puu.service.feedbackcategory.FeedbackCategoryService;

@Tag(name = "管理后台 - 反馈分类")
@RestController
@RequestMapping("/puu/feedback-category")
@Validated
public class FeedbackCategoryController {

    @Resource
    private FeedbackCategoryService feedbackCategoryService;

    @PostMapping("/create")
    @Operation(summary = "创建反馈分类")
    @PreAuthorize("@ss.hasPermission('puu:feedback-category:create')")
    public CommonResult<Long> createFeedbackCategory(@Valid @RequestBody FeedbackCategoryCreateReqVO createReqVO) {
        return success(feedbackCategoryService.createFeedbackCategory(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新反馈分类")
    @PreAuthorize("@ss.hasPermission('puu:feedback-category:update')")
    public CommonResult<Boolean> updateFeedbackCategory(@Valid @RequestBody FeedbackCategoryUpdateReqVO updateReqVO) {
        feedbackCategoryService.updateFeedbackCategory(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除反馈分类")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('puu:feedback-category:delete')")
    public CommonResult<Boolean> deleteFeedbackCategory(@RequestParam("id") Long id) {
        feedbackCategoryService.deleteFeedbackCategory(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得反馈分类")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('puu:feedback-category:query')")
    public CommonResult<FeedbackCategoryRespVO> getFeedbackCategory(@RequestParam("id") Long id) {
        FeedbackCategoryDO feedbackCategory = feedbackCategoryService.getFeedbackCategory(id);
        return success(FeedbackCategoryConvert.INSTANCE.convert(feedbackCategory));
    }

    @GetMapping("/list")
    @Operation(summary = "获得反馈分类列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('puu:feedback-category:query')")
    public CommonResult<List<FeedbackCategoryRespVO>> getFeedbackCategoryList(@RequestParam("ids") Collection<Long> ids) {
        List<FeedbackCategoryDO> list = feedbackCategoryService.getFeedbackCategoryList(ids);
        return success(FeedbackCategoryConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得反馈分类分页")
    @PreAuthorize("@ss.hasPermission('puu:feedback-category:query')")
    public CommonResult<PageResult<FeedbackCategoryRespVO>> getFeedbackCategoryPage(@Valid FeedbackCategoryPageReqVO pageVO) {
        PageResult<FeedbackCategoryDO> pageResult = feedbackCategoryService.getFeedbackCategoryPage(pageVO);
        return success(FeedbackCategoryConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出反馈分类 Excel")
    @PreAuthorize("@ss.hasPermission('puu:feedback-category:export')")
    @OperateLog(type = EXPORT)
    public void exportFeedbackCategoryExcel(@Valid FeedbackCategoryExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<FeedbackCategoryDO> list = feedbackCategoryService.getFeedbackCategoryList(exportReqVO);
        // 导出 Excel
        List<FeedbackCategoryExcelVO> datas = FeedbackCategoryConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "反馈分类.xls", "数据", FeedbackCategoryExcelVO.class, datas);
    }

}
