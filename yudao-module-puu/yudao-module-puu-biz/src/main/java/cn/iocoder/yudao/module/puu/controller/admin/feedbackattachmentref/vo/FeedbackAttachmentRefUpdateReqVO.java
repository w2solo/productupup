package cn.iocoder.yudao.module.puu.controller.admin.feedbackattachmentref.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import jakarta.validation.constraints.*;

@Schema(description = "管理后台 - 反馈关联的文件，多堆多更新 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FeedbackAttachmentRefUpdateReqVO extends FeedbackAttachmentRefBaseVO {

    @Schema(description = "主键", required = true, example = "18700")
    @NotNull(message = "主键不能为空")
    private Long id;

}
