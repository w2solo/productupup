package cn.iocoder.yudao.module.puu.controller.admin.notice.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import jakarta.validation.constraints.*;

/**
* 公告 Base VO，提供给添加、修改、详细的子 VO 使用
* 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
*/
@Data
public class NoticeBaseVO {

    @Schema(description = "公告标题", required = true)
    @NotNull(message = "公告标题不能为空")
    private String title;

    @Schema(description = "公告内容")
    private String content;

    @Schema(description = "跳转地址", example = "https://www.iocoder.cn")
    private String jumpUrl;

    @Schema(description = "项目id", example = "24911")
    private Long productId;

}
