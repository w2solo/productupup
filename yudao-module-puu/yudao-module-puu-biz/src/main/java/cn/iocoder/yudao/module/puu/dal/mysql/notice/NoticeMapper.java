package cn.iocoder.yudao.module.puu.dal.mysql.notice;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.puu.dal.dataobject.notice.NoticeDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.puu.controller.admin.notice.vo.*;

/**
 * 公告 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface NoticeMapper extends BaseMapperX<NoticeDO> {

    default PageResult<NoticeDO> selectPage(NoticePageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<NoticeDO>()
                .eqIfPresent(NoticeDO::getTitle, reqVO.getTitle())
                .eqIfPresent(NoticeDO::getContent, reqVO.getContent())
                .eqIfPresent(NoticeDO::getJumpUrl, reqVO.getJumpUrl())
                .betweenIfPresent(NoticeDO::getCreateTime, reqVO.getCreateTime())
                .eqIfPresent(NoticeDO::getProductId, reqVO.getProductId())
                .orderByDesc(NoticeDO::getId));
    }

    default List<NoticeDO> selectList(NoticeExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<NoticeDO>()
                .eqIfPresent(NoticeDO::getTitle, reqVO.getTitle())
                .eqIfPresent(NoticeDO::getContent, reqVO.getContent())
                .eqIfPresent(NoticeDO::getJumpUrl, reqVO.getJumpUrl())
                .betweenIfPresent(NoticeDO::getCreateTime, reqVO.getCreateTime())
                .eqIfPresent(NoticeDO::getProductId, reqVO.getProductId())
                .orderByDesc(NoticeDO::getId));
    }

}
