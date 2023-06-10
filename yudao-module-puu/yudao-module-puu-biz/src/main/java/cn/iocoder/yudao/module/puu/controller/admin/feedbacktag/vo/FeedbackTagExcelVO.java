package cn.iocoder.yudao.module.puu.controller.admin.feedbacktag.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;

/**
 * 反馈标签 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class FeedbackTagExcelVO {

    @ExcelProperty("主键")
    private Long id;

    @ExcelProperty("标签名称")
    private String tagName;

    @ExcelProperty("更新时间")
    private LocalDateTime createTime;

}
