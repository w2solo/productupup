package cn.iocoder.yudao.module.puu.controller.admin.feedbackcommentattachmentref.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 评论附件，多堆多 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FeedbackCommentAttachmentRefRespVO extends FeedbackCommentAttachmentRefBaseVO {

    @Schema(description = "主键", required = true, example = "18341")
    private Long id;

    @Schema(description = "创建时间")
    private LocalDateTime createTime;

}
