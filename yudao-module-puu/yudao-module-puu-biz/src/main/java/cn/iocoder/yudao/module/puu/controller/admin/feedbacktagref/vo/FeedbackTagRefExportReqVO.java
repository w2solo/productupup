package cn.iocoder.yudao.module.puu.controller.admin.feedbacktagref.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import java.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - 反馈的标签，多堆多 Excel 导出 Request VO，参数和 FeedbackTagRefPageReqVO 是一致的")
@Data
public class FeedbackTagRefExportReqVO {

    @Schema(description = "反馈id", example = "18337")
    private Long feedbackId;

    @Schema(description = "反馈标签id", example = "27225")
    private Long feedbackTagId;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime[] createTime;

}
