package cn.iocoder.yudao.module.puu.dal.dataobject.feedbacktagref;

import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.*;
import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;

/**
 * 反馈的标签，多堆多 DO
 *
 * @author 芋道源码
 */
@TableName("puu_feedback_tag_ref")
@KeySequence("puu_feedback_tag_ref_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FeedbackTagRefDO extends BaseDO {

    /**
     * 主键
     */
    @TableId
    private Long id;
    /**
     * 反馈id
     */
    private Long feedbackId;
    /**
     * 反馈标签id
     */
    private Long feedbackTagId;

}
