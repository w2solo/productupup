package cn.iocoder.yudao.module.puu.controller.admin.notice.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;

/**
 * 公告 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class NoticeExcelVO {

    @ExcelProperty("主键")
    private Long id;

    @ExcelProperty("公告标题")
    private String title;

    @ExcelProperty("公告内容")
    private String content;

    @ExcelProperty("跳转地址")
    private String jumpUrl;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

    @ExcelProperty("项目id")
    private Long productId;

}
