package cn.iocoder.yudao.module.puu.controller.admin.feedbackcomment;

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

import cn.iocoder.yudao.module.puu.controller.admin.feedbackcomment.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcomment.FeedbackCommentDO;
import cn.iocoder.yudao.module.puu.convert.feedbackcomment.FeedbackCommentConvert;
import cn.iocoder.yudao.module.puu.service.feedbackcomment.FeedbackCommentService;

@Tag(name = "管理后台 - 反馈评论")
@RestController
@RequestMapping("/puu/feedback-comment")
@Validated
public class FeedbackCommentController {

    @Resource
    private FeedbackCommentService feedbackCommentService;

    @PostMapping("/create")
    @Operation(summary = "创建反馈评论")
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment:create')")
    public CommonResult<Long> createFeedbackComment(@Valid @RequestBody FeedbackCommentCreateReqVO createReqVO) {
        return success(feedbackCommentService.createFeedbackComment(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新反馈评论")
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment:update')")
    public CommonResult<Boolean> updateFeedbackComment(@Valid @RequestBody FeedbackCommentUpdateReqVO updateReqVO) {
        feedbackCommentService.updateFeedbackComment(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除反馈评论")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment:delete')")
    public CommonResult<Boolean> deleteFeedbackComment(@RequestParam("id") Long id) {
        feedbackCommentService.deleteFeedbackComment(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得反馈评论")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment:query')")
    public CommonResult<FeedbackCommentRespVO> getFeedbackComment(@RequestParam("id") Long id) {
        FeedbackCommentDO feedbackComment = feedbackCommentService.getFeedbackComment(id);
        return success(FeedbackCommentConvert.INSTANCE.convert(feedbackComment));
    }

    @GetMapping("/list")
    @Operation(summary = "获得反馈评论列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment:query')")
    public CommonResult<List<FeedbackCommentRespVO>> getFeedbackCommentList(@RequestParam("ids") Collection<Long> ids) {
        List<FeedbackCommentDO> list = feedbackCommentService.getFeedbackCommentList(ids);
        return success(FeedbackCommentConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得反馈评论分页")
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment:query')")
    public CommonResult<PageResult<FeedbackCommentRespVO>> getFeedbackCommentPage(@Valid FeedbackCommentPageReqVO pageVO) {
        PageResult<FeedbackCommentDO> pageResult = feedbackCommentService.getFeedbackCommentPage(pageVO);
        return success(FeedbackCommentConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出反馈评论 Excel")
    @PreAuthorize("@ss.hasPermission('puu:feedback-comment:export')")
    @OperateLog(type = EXPORT)
    public void exportFeedbackCommentExcel(@Valid FeedbackCommentExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<FeedbackCommentDO> list = feedbackCommentService.getFeedbackCommentList(exportReqVO);
        // 导出 Excel
        List<FeedbackCommentExcelVO> datas = FeedbackCommentConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "反馈评论.xls", "数据", FeedbackCommentExcelVO.class, datas);
    }

}
