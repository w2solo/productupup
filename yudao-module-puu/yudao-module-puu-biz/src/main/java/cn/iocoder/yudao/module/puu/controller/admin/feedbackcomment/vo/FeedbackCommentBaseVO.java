package cn.iocoder.yudao.module.puu.controller.admin.feedbackcomment.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import jakarta.validation.constraints.*;

/**
* 反馈评论 Base VO，提供给添加、修改、详细的子 VO 使用
* 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
*/
@Data
public class FeedbackCommentBaseVO {

    @Schema(description = "关联的反馈id", required = true, example = "9410")
    @NotNull(message = "关联的反馈id不能为空")
    private Long feedbackId;

    @Schema(description = "评论详情", required = true)
    @NotNull(message = "评论详情不能为空")
    private String content;

    @Schema(description = "是否是官方回复")
    private Boolean official;

}
