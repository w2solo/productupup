package cn.iocoder.yudao.module.puu.controller.admin.feedbackcommentattachmentref.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.*;

@Schema(description = "管理后台 - 评论附件，多堆多创建 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FeedbackCommentAttachmentRefCreateReqVO extends FeedbackCommentAttachmentRefBaseVO {

}
