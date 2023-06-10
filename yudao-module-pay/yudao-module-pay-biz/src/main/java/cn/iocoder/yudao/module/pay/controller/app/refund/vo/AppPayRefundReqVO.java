package cn.iocoder.yudao.module.pay.controller.app.refund.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Schema(description = "用户 APP - 退款订单 Req VO")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AppPayRefundReqVO {

    @Schema(description = "支付订单编号自增", requiredMode = Schema.RequiredMode.REQUIRED, example = "10")
    @NotNull(message = "支付订单编号自增")
    private Long payOrderId;

    @Schema(description = "退款金额", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @NotNull(message = "退款金额")
    private Long amount;

    @Schema(description = "退款原因", requiredMode = Schema.RequiredMode.REQUIRED, example = "不喜欢")
    @NotEmpty(message = "退款原因")
    private String reason;

    @Schema(description = "商户退款订单号", requiredMode = Schema.RequiredMode.REQUIRED, example = "MR202111180000000001")
    //TODO 测试暂时模拟生成
    //@NotEmpty(message = "商户退款订单号")
    private String merchantRefundId;

}
