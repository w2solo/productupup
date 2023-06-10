package cn.iocoder.yudao.module.puu.controller.admin.product.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import jakarta.validation.constraints.*;

@Schema(description = "管理后台 - 项目更新 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class ProductUpdateReqVO extends ProductBaseVO {

    @Schema(description = "主键", required = true, example = "16988")
    @NotNull(message = "主键不能为空")
    private Long id;

}
