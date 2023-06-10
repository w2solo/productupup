package cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcommentattachmentref;

import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.*;
import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;

/**
 * 评论附件，多堆多 DO
 *
 * @author 芋道源码
 */
@TableName("puu_feedback_comment_attachment_ref")
@KeySequence("puu_feedback_comment_attachment_ref_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FeedbackCommentAttachmentRefDO extends BaseDO {

    /**
     * 主键
     */
    @TableId
    private Long id;
    /**
     * 反馈的评论id
     */
    private Long feedbackCommentId;
    /**
     * 文件id
     */
    private Long attachmentId;

}
