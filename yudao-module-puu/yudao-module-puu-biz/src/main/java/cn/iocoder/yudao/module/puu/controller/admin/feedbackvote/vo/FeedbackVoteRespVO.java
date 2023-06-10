package cn.iocoder.yudao.module.puu.controller.admin.feedbackvote.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 反馈投票 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FeedbackVoteRespVO extends FeedbackVoteBaseVO {

    @Schema(description = "主键", required = true, example = "11056")
    private Long id;

    @Schema(description = "创建时间")
    private LocalDateTime createTime;

}
