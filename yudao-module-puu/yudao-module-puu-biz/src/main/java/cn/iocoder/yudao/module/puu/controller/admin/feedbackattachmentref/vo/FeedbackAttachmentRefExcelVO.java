package cn.iocoder.yudao.module.puu.controller.admin.feedbackattachmentref.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;

/**
 * 反馈关联的文件，多堆多 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class FeedbackAttachmentRefExcelVO {

    @ExcelProperty("主键")
    private Long id;

    @ExcelProperty("反馈id")
    private Long feedbackId;

    @ExcelProperty("文件id")
    private Long attachmentId;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

}
