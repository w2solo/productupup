package cn.iocoder.yudao.module.puu.controller.admin.feedbacktagref.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import jakarta.validation.constraints.*;

@Schema(description = "管理后台 - 反馈的标签，多堆多更新 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FeedbackTagRefUpdateReqVO extends FeedbackTagRefBaseVO {

    @Schema(description = "主键", required = true, example = "11238")
    @NotNull(message = "主键不能为空")
    private Long id;

}
