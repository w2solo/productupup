package cn.iocoder.yudao.module.puu.controller.admin.feedbackcommentattachmentref;

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

import cn.iocoder.yudao.module.puu.controller.admin.feedbackcommentattachmentref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcommentattachmentref.FeedbackCommentAttachmentRefDO;
import cn.iocoder.yudao.module.puu.convert.feedbackcommentattachmentref.FeedbackCommentAttachmentRefConvert;
import cn.iocoder.yudao.module.puu.service.feedbackcommentattachmentref.FeedbackCommentAttachmentRefService;

@Tag(name = "管理后台 - 评论附件，多堆多")
@RestController
@RequestMapping("/puu/feedback-comment-attachment-ref")
@Validated
public class FeedbackCommentAttachmentRefController {

    @Resource
    private FeedbackCommentAttachmentRefService feedbackCommentAttachmentRefService;

    @PostMapping("/create")
    @Operation(summary = "创建评论附件，多堆多")
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment-attachment-ref:create')")
    public CommonResult<Long> createFeedbackCommentAttachmentRef(@Valid @RequestBody FeedbackCommentAttachmentRefCreateReqVO createReqVO) {
        return success(feedbackCommentAttachmentRefService.createFeedbackCommentAttachmentRef(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新评论附件，多堆多")
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment-attachment-ref:update')")
    public CommonResult<Boolean> updateFeedbackCommentAttachmentRef(@Valid @RequestBody FeedbackCommentAttachmentRefUpdateReqVO updateReqVO) {
        feedbackCommentAttachmentRefService.updateFeedbackCommentAttachmentRef(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除评论附件，多堆多")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment-attachment-ref:delete')")
    public CommonResult<Boolean> deleteFeedbackCommentAttachmentRef(@RequestParam("id") Long id) {
        feedbackCommentAttachmentRefService.deleteFeedbackCommentAttachmentRef(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得评论附件，多堆多")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment-attachment-ref:query')")
    public CommonResult<FeedbackCommentAttachmentRefRespVO> getFeedbackCommentAttachmentRef(@RequestParam("id") Long id) {
        FeedbackCommentAttachmentRefDO feedbackCommentAttachmentRef = feedbackCommentAttachmentRefService.getFeedbackCommentAttachmentRef(id);
        return success(FeedbackCommentAttachmentRefConvert.INSTANCE.convert(feedbackCommentAttachmentRef));
    }

    @GetMapping("/list")
    @Operation(summary = "获得评论附件，多堆多列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment-attachment-ref:query')")
    public CommonResult<List<FeedbackCommentAttachmentRefRespVO>> getFeedbackCommentAttachmentRefList(@RequestParam("ids") Collection<Long> ids) {
        List<FeedbackCommentAttachmentRefDO> list = feedbackCommentAttachmentRefService.getFeedbackCommentAttachmentRefList(ids);
        return success(FeedbackCommentAttachmentRefConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得评论附件，多堆多分页")
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment-attachment-ref:query')")
    public CommonResult<PageResult<FeedbackCommentAttachmentRefRespVO>> getFeedbackCommentAttachmentRefPage(@Valid FeedbackCommentAttachmentRefPageReqVO pageVO) {
        PageResult<FeedbackCommentAttachmentRefDO> pageResult = feedbackCommentAttachmentRefService.getFeedbackCommentAttachmentRefPage(pageVO);
        return success(FeedbackCommentAttachmentRefConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出评论附件，多堆多 Excel")
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment-attachment-ref:export')")
    @OperateLog(type = EXPORT)
    public void exportFeedbackCommentAttachmentRefExcel(@Valid FeedbackCommentAttachmentRefExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<FeedbackCommentAttachmentRefDO> list = feedbackCommentAttachmentRefService.getFeedbackCommentAttachmentRefList(exportReqVO);
        // 导出 Excel
        List<FeedbackCommentAttachmentRefExcelVO> datas = FeedbackCommentAttachmentRefConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "评论附件，多堆多.xls", "数据", FeedbackCommentAttachmentRefExcelVO.class, datas);
    }

}
