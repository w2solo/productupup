package cn.iocoder.yudao.module.puu.controller.admin.product.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;

/**
 * 项目 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class ProductExcelVO {

    @ExcelProperty("主键")
    private Long id;

    @ExcelProperty("项目名称")
    private String name;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

}
