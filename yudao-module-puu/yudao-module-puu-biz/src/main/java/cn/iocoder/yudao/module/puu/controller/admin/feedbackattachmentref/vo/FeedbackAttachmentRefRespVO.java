package cn.iocoder.yudao.module.puu.controller.admin.feedbackattachmentref.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 反馈关联的文件，多堆多 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FeedbackAttachmentRefRespVO extends FeedbackAttachmentRefBaseVO {

    @Schema(description = "主键", required = true, example = "18700")
    private Long id;

    @Schema(description = "创建时间")
    private LocalDateTime createTime;

}
