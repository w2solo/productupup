package cn.iocoder.yudao.module.puu.controller.admin.feedbacktag.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 反馈标签 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FeedbackTagRespVO extends FeedbackTagBaseVO {

    @Schema(description = "主键", required = true, example = "13939")
    private Long id;

    @Schema(description = "更新时间")
    private LocalDateTime createTime;

}
