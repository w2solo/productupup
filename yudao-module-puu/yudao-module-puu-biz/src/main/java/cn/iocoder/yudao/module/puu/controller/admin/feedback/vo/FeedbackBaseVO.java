package cn.iocoder.yudao.module.puu.controller.admin.feedback.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import jakarta.validation.constraints.*;

/**
* 反馈 Base VO，提供给添加、修改、详细的子 VO 使用
* 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
*/
@Data
public class FeedbackBaseVO {

    @Schema(description = "项目id", required = true, example = "9840")
    @NotNull(message = "项目id不能为空")
    private Long productId;

    @Schema(description = "标题", required = true)
    @NotNull(message = "标题不能为空")
    private String title;

    @Schema(description = "内容", required = true)
    @NotNull(message = "内容不能为空")
    private String detail;

    @Schema(description = "反馈分类id", example = "15370")
    private Long feedbackCategoryId;

    @Schema(description = "是否添加到roadmap", required = true)
    @NotNull(message = "是否添加到roadmap不能为空")
    private Boolean roadmapAdded;

    @Schema(description = "进度类型")
    private Integer progress;

    @Schema(description = "状态：公开、不公开等，默认公开", required = true, example = "2")
    @NotNull(message = "状态：公开、不公开等，默认公开不能为空")
    private Integer status;

    @Schema(description = "被合并到某反馈下", example = "8150")
    private Long mergedId;

    @Schema(description = "用户环境")
    private String userEnvironment;

}
