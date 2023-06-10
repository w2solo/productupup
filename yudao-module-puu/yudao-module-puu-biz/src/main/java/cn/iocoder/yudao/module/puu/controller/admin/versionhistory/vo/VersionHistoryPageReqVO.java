package cn.iocoder.yudao.module.puu.controller.admin.versionhistory.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import org.springframework.format.annotation.DateTimeFormat;
import java.time.LocalDateTime;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - 版本历史分页 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class VersionHistoryPageReqVO extends PageParam {

    @Schema(description = "版本标题")
    private String title;

    @Schema(description = "版本名称", example = "李四")
    private String versionName;

    @Schema(description = "版本号")
    private Integer versionCode;

    @Schema(description = "版本内容")
    private String content;

    @Schema(description = "更新时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime[] createTime;

    @Schema(description = "项目id", example = "4853")
    private Long productId;

}
