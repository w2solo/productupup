package cn.iocoder.yudao.module.puu.controller.admin.feedbackvote.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import java.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - 反馈投票 Excel 导出 Request VO，参数和 FeedbackVotePageReqVO 是一致的")
@Data
public class FeedbackVoteExportReqVO {

    @Schema(description = "反馈id", example = "10017")
    private Long feedbackId;

    @Schema(description = "投票人", example = "16464")
    private Long voteUserId;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime[] createTime;

}
