package cn.iocoder.yudao.module.puu.controller.admin.versionhistory.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import jakarta.validation.constraints.*;

@Schema(description = "管理后台 - 版本历史更新 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class VersionHistoryUpdateReqVO extends VersionHistoryBaseVO {

    @Schema(description = "主键", required = true, example = "6533")
    @NotNull(message = "主键不能为空")
    private Long id;

}
