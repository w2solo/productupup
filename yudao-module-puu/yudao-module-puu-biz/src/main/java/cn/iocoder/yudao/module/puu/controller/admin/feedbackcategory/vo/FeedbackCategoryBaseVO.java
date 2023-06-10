package cn.iocoder.yudao.module.puu.controller.admin.feedbackcategory.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import jakarta.validation.constraints.*;

/**
* 反馈分类 Base VO，提供给添加、修改、详细的子 VO 使用
* 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
*/
@Data
public class FeedbackCategoryBaseVO {

    @Schema(description = "项目id", required = true, example = "5890")
    @NotNull(message = "项目id不能为空")
    private Long productId;

    @Schema(description = "分类名称", example = "赵六")
    private String name;

}
