package cn.iocoder.yudao.module.puu.controller.admin.feedbackcommentattachmentref.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import jakarta.validation.constraints.*;

/**
* 评论附件，多堆多 Base VO，提供给添加、修改、详细的子 VO 使用
* 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
*/
@Data
public class FeedbackCommentAttachmentRefBaseVO {

    @Schema(description = "反馈的评论id", required = true, example = "29119")
    @NotNull(message = "反馈的评论id不能为空")
    private Long feedbackCommentId;

    @Schema(description = "文件id", required = true, example = "10798")
    @NotNull(message = "文件id不能为空")
    private Long attachmentId;

}
