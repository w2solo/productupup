package cn.iocoder.yudao.module.puu.controller.admin.feedback.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;

/**
 * 反馈 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class FeedbackExcelVO {

    @ExcelProperty("主键")
    private Long id;

    @ExcelProperty("项目id")
    private Long productId;

    @ExcelProperty("标题")
    private String title;

    @ExcelProperty("内容")
    private String detail;

    @ExcelProperty("反馈分类id")
    private Long feedbackCategoryId;

    @ExcelProperty("是否添加到roadmap")
    private Boolean roadmapAdded;

    @ExcelProperty("进度类型")
    private Integer progress;

    @ExcelProperty("状态：公开、不公开等，默认公开")
    private Integer status;

    @ExcelProperty("被合并到某反馈下")
    private Long mergedId;

    @ExcelProperty("用户环境")
    private String userEnvironment;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

}
