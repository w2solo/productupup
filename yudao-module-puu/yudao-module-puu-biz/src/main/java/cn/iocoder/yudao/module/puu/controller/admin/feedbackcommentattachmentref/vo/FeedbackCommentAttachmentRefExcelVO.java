package cn.iocoder.yudao.module.puu.controller.admin.feedbackcommentattachmentref.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;

/**
 * 评论附件，多堆多 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class FeedbackCommentAttachmentRefExcelVO {

    @ExcelProperty("主键")
    private Long id;

    @ExcelProperty("反馈的评论id")
    private Long feedbackCommentId;

    @ExcelProperty("文件id")
    private Long attachmentId;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

}
