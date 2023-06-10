package cn.iocoder.yudao.module.puu.controller.admin.feedbackattachmentref.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.*;

@Schema(description = "管理后台 - 反馈关联的文件，多堆多创建 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class FeedbackAttachmentRefCreateReqVO extends FeedbackAttachmentRefBaseVO {

}
