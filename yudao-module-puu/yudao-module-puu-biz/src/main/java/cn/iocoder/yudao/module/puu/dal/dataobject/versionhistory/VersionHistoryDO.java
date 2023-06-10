package cn.iocoder.yudao.module.puu.dal.dataobject.versionhistory;

import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.*;
import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;

/**
 * 版本历史 DO
 *
 * @author 芋道源码
 */
@TableName("puu_version_history")
@KeySequence("puu_version_history_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class VersionHistoryDO extends BaseDO {

    /**
     * 主键
     */
    @TableId
    private Long id;
    /**
     * 版本标题
     */
    private String title;
    /**
     * 版本名称
     */
    private String versionName;
    /**
     * 版本号
     */
    private Integer versionCode;
    /**
     * 版本内容
     */
    private String content;
    /**
     * 项目id
     */
    private Long productId;

}
