package cn.iocoder.yudao.module.puu.dal.dataobject.feedback;

import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.*;
import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;

/**
 * 反馈 DO
 *
 * @author 芋道源码
 */
@TableName("puu_feedback")
@KeySequence("puu_feedback_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FeedbackDO extends BaseDO {

    /**
     * 主键
     */
    @TableId
    private Long id;
    /**
     * 项目id
     */
    private Long productId;
    /**
     * 标题
     */
    private String title;
    /**
     * 内容
     */
    private String detail;
    /**
     * 反馈分类id
     */
    private Long feedbackCategoryId;
    /**
     * 是否添加到roadmap
     */
    private Boolean roadmapAdded;
    /**
     * 进度类型
     */
    private Integer progress;
    /**
     * 状态：公开、不公开等，默认公开
     */
    private Integer status;
    /**
     * 被合并到某反馈下
     */
    private Long mergedId;
    /**
     * 用户环境
     */
    private String userEnvironment;

}
