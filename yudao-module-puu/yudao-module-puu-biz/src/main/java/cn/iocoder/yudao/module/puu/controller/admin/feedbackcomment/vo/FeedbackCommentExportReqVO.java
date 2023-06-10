package cn.iocoder.yudao.module.puu.controller.admin.feedbackcomment.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import java.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - 反馈评论 Excel 导出 Request VO，参数和 FeedbackCommentPageReqVO 是一致的")
@Data
public class FeedbackCommentExportReqVO {

    @Schema(description = "关联的反馈id", example = "9410")
    private Long feedbackId;

    @Schema(description = "评论详情")
    private String content;

    @Schema(description = "是否是官方回复")
    private Boolean official;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime[] createTime;

}
