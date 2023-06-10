package cn.iocoder.yudao.module.puu.controller.admin.feedback.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import java.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - 反馈 Excel 导出 Request VO，参数和 FeedbackPageReqVO 是一致的")
@Data
public class FeedbackExportReqVO {

    @Schema(description = "项目id", example = "9840")
    private Long productId;

    @Schema(description = "标题")
    private String title;

    @Schema(description = "内容")
    private String detail;

    @Schema(description = "反馈分类id", example = "15370")
    private Long feedbackCategoryId;

    @Schema(description = "是否添加到roadmap")
    private Boolean roadmapAdded;

    @Schema(description = "进度类型")
    private Integer progress;

    @Schema(description = "状态：公开、不公开等，默认公开", example = "2")
    private Integer status;

    @Schema(description = "被合并到某反馈下", example = "8150")
    private Long mergedId;

    @Schema(description = "用户环境")
    private String userEnvironment;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime[] createTime;

}
