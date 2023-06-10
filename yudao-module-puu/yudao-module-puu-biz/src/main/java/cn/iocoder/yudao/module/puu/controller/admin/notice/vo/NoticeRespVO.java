package cn.iocoder.yudao.module.puu.controller.admin.notice.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 公告 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class NoticeRespVO extends NoticeBaseVO {

    @Schema(description = "主键", required = true, example = "18274")
    private Long id;

    @Schema(description = "创建时间")
    private LocalDateTime createTime;

}
