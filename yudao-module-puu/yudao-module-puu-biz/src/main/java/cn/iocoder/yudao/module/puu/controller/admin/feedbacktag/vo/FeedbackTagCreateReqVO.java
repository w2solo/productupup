package cn.iocoder.yudao.module.puu.controller.admin.feedbacktag.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.*;

@Schema(description = "管理后台 - 反馈标签创建 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FeedbackTagCreateReqVO extends FeedbackTagBaseVO {

}
