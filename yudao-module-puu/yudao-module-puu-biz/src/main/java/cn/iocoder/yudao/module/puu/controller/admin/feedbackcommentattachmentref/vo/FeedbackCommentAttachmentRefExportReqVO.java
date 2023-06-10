package cn.iocoder.yudao.module.puu.controller.admin.feedbackcommentattachmentref.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import java.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - 评论附件，多堆多 Excel 导出 Request VO，参数和 FeedbackCommentAttachmentRefPageReqVO 是一致的")
@Data
public class FeedbackCommentAttachmentRefExportReqVO {

    @Schema(description = "反馈的评论id", example = "29119")
    private Long feedbackCommentId;

    @Schema(description = "文件id", example = "10798")
    private Long attachmentId;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime[] createTime;

}
