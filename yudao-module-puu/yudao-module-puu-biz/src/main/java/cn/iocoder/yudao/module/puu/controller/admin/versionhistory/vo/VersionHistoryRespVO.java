package cn.iocoder.yudao.module.puu.controller.admin.versionhistory.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 版本历史 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class VersionHistoryRespVO extends VersionHistoryBaseVO {

    @Schema(description = "主键", required = true, example = "6533")
    private Long id;

    @Schema(description = "更新时间")
    private LocalDateTime createTime;

}
