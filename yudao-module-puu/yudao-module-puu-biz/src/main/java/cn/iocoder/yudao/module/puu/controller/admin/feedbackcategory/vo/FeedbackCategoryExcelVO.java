package cn.iocoder.yudao.module.puu.controller.admin.feedbackcategory.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;

/**
 * 反馈分类 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class FeedbackCategoryExcelVO {

    @ExcelProperty("主键")
    private Long id;

    @ExcelProperty("项目id")
    private Long productId;

    @ExcelProperty("分类名称")
    private String name;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

}
