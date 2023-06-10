package cn.iocoder.yudao.module.puu.controller.admin.feedbackattachmentref;

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

import cn.iocoder.yudao.module.puu.controller.admin.feedbackattachmentref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackattachmentref.FeedbackAttachmentRefDO;
import cn.iocoder.yudao.module.puu.convert.feedbackattachmentref.FeedbackAttachmentRefConvert;
import cn.iocoder.yudao.module.puu.service.feedbackattachmentref.FeedbackAttachmentRefService;

@Tag(name = "管理后台 - 反馈关联的文件，多堆多")
@RestController
@RequestMapping("/puu/feedback-attachment-ref")
@Validated
public class FeedbackAttachmentRefController {

    @Resource
    private FeedbackAttachmentRefService feedbackAttachmentRefService;

    @PostMapping("/create")
    @Operation(summary = "创建反馈关联的文件，多堆多")
    @PreAuthorize("@ss.hasPermission('puu:feedback-attachment-ref:create')")
    public CommonResult<Long> createFeedbackAttachmentRef(@Valid @RequestBody FeedbackAttachmentRefCreateReqVO createReqVO) {
        return success(feedbackAttachmentRefService.createFeedbackAttachmentRef(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新反馈关联的文件，多堆多")
    @PreAuthorize("@ss.hasPermission('puu:feedback-attachment-ref:update')")
    public CommonResult<Boolean> updateFeedbackAttachmentRef(@Valid @RequestBody FeedbackAttachmentRefUpdateReqVO updateReqVO) {
        feedbackAttachmentRefService.updateFeedbackAttachmentRef(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除反馈关联的文件，多堆多")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('puu:feedback-attachment-ref:delete')")
    public CommonResult<Boolean> deleteFeedbackAttachmentRef(@RequestParam("id") Long id) {
        feedbackAttachmentRefService.deleteFeedbackAttachmentRef(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得反馈关联的文件，多堆多")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('puu:feedback-attachment-ref:query')")
    public CommonResult<FeedbackAttachmentRefRespVO> getFeedbackAttachmentRef(@RequestParam("id") Long id) {
        FeedbackAttachmentRefDO feedbackAttachmentRef = feedbackAttachmentRefService.getFeedbackAttachmentRef(id);
        return success(FeedbackAttachmentRefConvert.INSTANCE.convert(feedbackAttachmentRef));
    }

    @GetMapping("/list")
    @Operation(summary = "获得反馈关联的文件，多堆多列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('puu:feedback-attachment-ref:query')")
    public CommonResult<List<FeedbackAttachmentRefRespVO>> getFeedbackAttachmentRefList(@RequestParam("ids") Collection<Long> ids) {
        List<FeedbackAttachmentRefDO> list = feedbackAttachmentRefService.getFeedbackAttachmentRefList(ids);
        return success(FeedbackAttachmentRefConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得反馈关联的文件，多堆多分页")
    @PreAuthorize("@ss.hasPermission('puu:feedback-attachment-ref:query')")
    public CommonResult<PageResult<FeedbackAttachmentRefRespVO>> getFeedbackAttachmentRefPage(@Valid FeedbackAttachmentRefPageReqVO pageVO) {
        PageResult<FeedbackAttachmentRefDO> pageResult = feedbackAttachmentRefService.getFeedbackAttachmentRefPage(pageVO);
        return success(FeedbackAttachmentRefConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出反馈关联的文件，多堆多 Excel")
    @PreAuthorize("@ss.hasPermission('puu:feedback-attachment-ref:export')")
    @OperateLog(type = EXPORT)
    public void exportFeedbackAttachmentRefExcel(@Valid FeedbackAttachmentRefExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<FeedbackAttachmentRefDO> list = feedbackAttachmentRefService.getFeedbackAttachmentRefList(exportReqVO);
        // 导出 Excel
        List<FeedbackAttachmentRefExcelVO> datas = FeedbackAttachmentRefConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "反馈关联的文件，多堆多.xls", "数据", FeedbackAttachmentRefExcelVO.class, datas);
    }

}
