package cn.iocoder.yudao.module.puu.controller.admin.versionhistory.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;

/**
 * 版本历史 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class VersionHistoryExcelVO {

    @ExcelProperty("主键")
    private Long id;

    @ExcelProperty("版本标题")
    private String title;

    @ExcelProperty("版本名称")
    private String versionName;

    @ExcelProperty("版本号")
    private Integer versionCode;

    @ExcelProperty("版本内容")
    private String content;

    @ExcelProperty("更新时间")
    private LocalDateTime createTime;

    @ExcelProperty("项目id")
    private Long productId;

}
