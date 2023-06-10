package cn.iocoder.yudao.module.puu.controller.admin.feedbacktagref;

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

import cn.iocoder.yudao.module.puu.controller.admin.feedbacktagref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbacktagref.FeedbackTagRefDO;
import cn.iocoder.yudao.module.puu.convert.feedbacktagref.FeedbackTagRefConvert;
import cn.iocoder.yudao.module.puu.service.feedbacktagref.FeedbackTagRefService;

@Tag(name = "管理后台 - 反馈的标签，多堆多")
@RestController
@RequestMapping("/puu/feedback-tag-ref")
@Validated
public class FeedbackTagRefController {

    @Resource
    private FeedbackTagRefService feedbackTagRefService;

    @PostMapping("/create")
    @Operation(summary = "创建反馈的标签，多堆多")
    @PreAuthorize("@ss.hasPermission('puu:feedback-tag-ref:create')")
    public CommonResult<Long> createFeedbackTagRef(@Valid @RequestBody FeedbackTagRefCreateReqVO createReqVO) {
        return success(feedbackTagRefService.createFeedbackTagRef(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新反馈的标签，多堆多")
    @PreAuthorize("@ss.hasPermission('puu:feedback-tag-ref:update')")
    public CommonResult<Boolean> updateFeedbackTagRef(@Valid @RequestBody FeedbackTagRefUpdateReqVO updateReqVO) {
        feedbackTagRefService.updateFeedbackTagRef(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除反馈的标签，多堆多")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('puu:feedback-tag-ref:delete')")
    public CommonResult<Boolean> deleteFeedbackTagRef(@RequestParam("id") Long id) {
        feedbackTagRefService.deleteFeedbackTagRef(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得反馈的标签，多堆多")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('puu:feedback-tag-ref:query')")
    public CommonResult<FeedbackTagRefRespVO> getFeedbackTagRef(@RequestParam("id") Long id) {
        FeedbackTagRefDO feedbackTagRef = feedbackTagRefService.getFeedbackTagRef(id);
        return success(FeedbackTagRefConvert.INSTANCE.convert(feedbackTagRef));
    }

    @GetMapping("/list")
    @Operation(summary = "获得反馈的标签，多堆多列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('puu:feedback-tag-ref:query')")
    public CommonResult<List<FeedbackTagRefRespVO>> getFeedbackTagRefList(@RequestParam("ids") Collection<Long> ids) {
        List<FeedbackTagRefDO> list = feedbackTagRefService.getFeedbackTagRefList(ids);
        return success(FeedbackTagRefConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得反馈的标签，多堆多分页")
    @PreAuthorize("@ss.hasPermission('puu:feedback-tag-ref:query')")
    public CommonResult<PageResult<FeedbackTagRefRespVO>> getFeedbackTagRefPage(@Valid FeedbackTagRefPageReqVO pageVO) {
        PageResult<FeedbackTagRefDO> pageResult = feedbackTagRefService.getFeedbackTagRefPage(pageVO);
        return success(FeedbackTagRefConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出反馈的标签，多堆多 Excel")
    @PreAuthorize("@ss.hasPermission('puu:feedback-tag-ref:export')")
    @OperateLog(type = EXPORT)
    public void exportFeedbackTagRefExcel(@Valid FeedbackTagRefExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<FeedbackTagRefDO> list = feedbackTagRefService.getFeedbackTagRefList(exportReqVO);
        // 导出 Excel
        List<FeedbackTagRefExcelVO> datas = FeedbackTagRefConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "反馈的标签，多堆多.xls", "数据", FeedbackTagRefExcelVO.class, datas);
    }

}
