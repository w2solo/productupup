package cn.iocoder.yudao.module.puu.dal.mysql.versionhistory;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.puu.dal.dataobject.versionhistory.VersionHistoryDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.puu.controller.admin.versionhistory.vo.*;

/**
 * 版本历史 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface VersionHistoryMapper extends BaseMapperX<VersionHistoryDO> {

    default PageResult<VersionHistoryDO> selectPage(VersionHistoryPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<VersionHistoryDO>()
                .eqIfPresent(VersionHistoryDO::getTitle, reqVO.getTitle())
                .likeIfPresent(VersionHistoryDO::getVersionName, reqVO.getVersionName())
                .eqIfPresent(VersionHistoryDO::getVersionCode, reqVO.getVersionCode())
                .eqIfPresent(VersionHistoryDO::getContent, reqVO.getContent())
                .betweenIfPresent(VersionHistoryDO::getCreateTime, reqVO.getCreateTime())
                .eqIfPresent(VersionHistoryDO::getProductId, reqVO.getProductId())
                .orderByDesc(VersionHistoryDO::getId));
    }

    default List<VersionHistoryDO> selectList(VersionHistoryExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<VersionHistoryDO>()
                .eqIfPresent(VersionHistoryDO::getTitle, reqVO.getTitle())
                .likeIfPresent(VersionHistoryDO::getVersionName, reqVO.getVersionName())
                .eqIfPresent(VersionHistoryDO::getVersionCode, reqVO.getVersionCode())
                .eqIfPresent(VersionHistoryDO::getContent, reqVO.getContent())
                .betweenIfPresent(VersionHistoryDO::getCreateTime, reqVO.getCreateTime())
                .eqIfPresent(VersionHistoryDO::getProductId, reqVO.getProductId())
                .orderByDesc(VersionHistoryDO::getId));
    }

}
