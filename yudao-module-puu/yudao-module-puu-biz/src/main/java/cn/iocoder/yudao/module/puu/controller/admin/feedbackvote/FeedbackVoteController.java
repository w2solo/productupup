package cn.iocoder.yudao.module.puu.controller.admin.feedbackvote;

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

import cn.iocoder.yudao.module.puu.controller.admin.feedbackvote.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackvote.FeedbackVoteDO;
import cn.iocoder.yudao.module.puu.convert.feedbackvote.FeedbackVoteConvert;
import cn.iocoder.yudao.module.puu.service.feedbackvote.FeedbackVoteService;

@Tag(name = "管理后台 - 反馈投票")
@RestController
@RequestMapping("/puu/feedback-vote")
@Validated
public class FeedbackVoteController {

    @Resource
    private FeedbackVoteService feedbackVoteService;

    @PostMapping("/create")
    @Operation(summary = "创建反馈投票")
    @PreAuthorize("@ss.hasPermission('puu:feedback-vote:create')")
    public CommonResult<Long> createFeedbackVote(@Valid @RequestBody FeedbackVoteCreateReqVO createReqVO) {
        return success(feedbackVoteService.createFeedbackVote(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新反馈投票")
    @PreAuthorize("@ss.hasPermission('puu:feedback-vote:update')")
    public CommonResult<Boolean> updateFeedbackVote(@Valid @RequestBody FeedbackVoteUpdateReqVO updateReqVO) {
        feedbackVoteService.updateFeedbackVote(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除反馈投票")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('puu:feedback-vote:delete')")
    public CommonResult<Boolean> deleteFeedbackVote(@RequestParam("id") Long id) {
        feedbackVoteService.deleteFeedbackVote(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得反馈投票")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('puu:feedback-vote:query')")
    public CommonResult<FeedbackVoteRespVO> getFeedbackVote(@RequestParam("id") Long id) {
        FeedbackVoteDO feedbackVote = feedbackVoteService.getFeedbackVote(id);
        return success(FeedbackVoteConvert.INSTANCE.convert(feedbackVote));
    }

    @GetMapping("/list")
    @Operation(summary = "获得反馈投票列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('puu:feedback-vote:query')")
    public CommonResult<List<FeedbackVoteRespVO>> getFeedbackVoteList(@RequestParam("ids") Collection<Long> ids) {
        List<FeedbackVoteDO> list = feedbackVoteService.getFeedbackVoteList(ids);
        return success(FeedbackVoteConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得反馈投票分页")
    @PreAuthorize("@ss.hasPermission('puu:feedback-vote:query')")
    public CommonResult<PageResult<FeedbackVoteRespVO>> getFeedbackVotePage(@Valid FeedbackVotePageReqVO pageVO) {
        PageResult<FeedbackVoteDO> pageResult = feedbackVoteService.getFeedbackVotePage(pageVO);
        return success(FeedbackVoteConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出反馈投票 Excel")
    @PreAuthorize("@ss.hasPermission('puu:feedback-vote:export')")
    @OperateLog(type = EXPORT)
    public void exportFeedbackVoteExcel(@Valid FeedbackVoteExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<FeedbackVoteDO> list = feedbackVoteService.getFeedbackVoteList(exportReqVO);
        // 导出 Excel
        List<FeedbackVoteExcelVO> datas = FeedbackVoteConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "反馈投票.xls", "数据", FeedbackVoteExcelVO.class, datas);
    }

}
