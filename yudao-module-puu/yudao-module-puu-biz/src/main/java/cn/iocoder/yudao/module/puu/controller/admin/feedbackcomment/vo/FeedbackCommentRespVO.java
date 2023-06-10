package cn.iocoder.yudao.module.puu.controller.admin.feedbackcomment.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 反馈评论 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FeedbackCommentRespVO extends FeedbackCommentBaseVO {

    @Schema(description = "主键", required = true, example = "25755")
    private Long id;

    @Schema(description = "创建时间")
    private LocalDateTime createTime;

}
