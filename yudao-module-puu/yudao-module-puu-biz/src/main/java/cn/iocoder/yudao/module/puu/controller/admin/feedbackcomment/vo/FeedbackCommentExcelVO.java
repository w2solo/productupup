package cn.iocoder.yudao.module.puu.controller.admin.feedbackcomment.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;

/**
 * 反馈评论 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class FeedbackCommentExcelVO {

    @ExcelProperty("主键")
    private Long id;

    @ExcelProperty("关联的反馈id")
    private Long feedbackId;

    @ExcelProperty("评论详情")
    private String content;

    @ExcelProperty("是否是官方回复")
    private Boolean official;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

}
