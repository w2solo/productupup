package cn.iocoder.yudao.module.puu.controller.admin.versionhistory.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import jakarta.validation.constraints.*;

/**
* 版本历史 Base VO，提供给添加、修改、详细的子 VO 使用
* 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
*/
@Data
public class VersionHistoryBaseVO {

    @Schema(description = "版本标题")
    private String title;

    @Schema(description = "版本名称", required = true, example = "李四")
    @NotNull(message = "版本名称不能为空")
    private String versionName;

    @Schema(description = "版本号", required = true)
    @NotNull(message = "版本号不能为空")
    private Integer versionCode;

    @Schema(description = "版本内容")
    private String content;

    @Schema(description = "项目id", example = "4853")
    private Long productId;

}
