package cn.iocoder.yudao.module.puu.dal.dataobject.feedbacktag;

import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.*;
import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;

/**
 * 反馈标签 DO
 *
 * @author 芋道源码
 */
@TableName("puu_feedback_tag")
@KeySequence("puu_feedback_tag_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FeedbackTagDO extends BaseDO {

    /**
     * 主键
     */
    @TableId
    private Long id;
    /**
     * 标签名称
     */
    private String tagName;

}
