package cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcomment;

import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.*;
import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;

/**
 * 反馈评论 DO
 *
 * @author 芋道源码
 */
@TableName("puu_feedback_comment")
@KeySequence("puu_feedback_comment_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FeedbackCommentDO extends BaseDO {

    /**
     * 主键
     */
    @TableId
    private Long id;
    /**
     * 关联的反馈id
     */
    private Long feedbackId;
    /**
     * 评论详情
     */
    private String content;
    /**
     * 是否是官方回复
     */
    private Boolean official;

}
