package cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcategory;

import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.*;
import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;

/**
 * 反馈分类 DO
 *
 * @author 芋道源码
 */
@TableName("puu_feedback_category")
@KeySequence("puu_feedback_category_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FeedbackCategoryDO extends BaseDO {

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
     * 分类名称
     */
    private String name;

}
