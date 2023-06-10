package cn.iocoder.yudao.module.puu.controller.admin.feedbacktagref.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 反馈的标签，多堆多 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FeedbackTagRefRespVO extends FeedbackTagRefBaseVO {

    @Schema(description = "主键", required = true, example = "11238")
    private Long id;

    @Schema(description = "创建时间")
    private LocalDateTime createTime;

}
