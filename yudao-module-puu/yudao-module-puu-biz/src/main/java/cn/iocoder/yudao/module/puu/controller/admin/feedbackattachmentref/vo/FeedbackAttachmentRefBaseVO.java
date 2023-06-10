package cn.iocoder.yudao.module.puu.controller.admin.feedbackattachmentref.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import jakarta.validation.constraints.*;

/**
* 反馈关联的文件，多堆多 Base VO，提供给添加、修改、详细的子 VO 使用
* 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
*/
@Data
public class FeedbackAttachmentRefBaseVO {

    @Schema(description = "反馈id", required = true, example = "10726")
    @NotNull(message = "反馈id不能为空")
    private Long feedbackId;

    @Schema(description = "文件id", required = true, example = "29849")
    @NotNull(message = "文件id不能为空")
    private Long attachmentId;

}
