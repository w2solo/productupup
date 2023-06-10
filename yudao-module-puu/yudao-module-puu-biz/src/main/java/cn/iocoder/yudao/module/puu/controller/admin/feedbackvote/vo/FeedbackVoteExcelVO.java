package cn.iocoder.yudao.module.puu.controller.admin.feedbackvote.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;

/**
 * 反馈投票 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class FeedbackVoteExcelVO {

    @ExcelProperty("主键")
    private Long id;

    @ExcelProperty("反馈id")
    private Long feedbackId;

    @ExcelProperty("投票人")
    private Long voteUserId;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

}
