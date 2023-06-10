package cn.iocoder.yudao.module.puu.dal.mysql.feedback;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedback.FeedbackDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.puu.controller.admin.feedback.vo.*;

/**
 * 反馈 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackMapper extends BaseMapperX<FeedbackDO> {

    default PageResult<FeedbackDO> selectPage(FeedbackPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<FeedbackDO>()
                .eqIfPresent(FeedbackDO::getProductId, reqVO.getProductId())
                .eqIfPresent(FeedbackDO::getTitle, reqVO.getTitle())
                .eqIfPresent(FeedbackDO::getDetail, reqVO.getDetail())
                .eqIfPresent(FeedbackDO::getFeedbackCategoryId, reqVO.getFeedbackCategoryId())
                .eqIfPresent(FeedbackDO::getRoadmapAdded, reqVO.getRoadmapAdded())
                .eqIfPresent(FeedbackDO::getProgress, reqVO.getProgress())
                .eqIfPresent(FeedbackDO::getStatus, reqVO.getStatus())
                .eqIfPresent(FeedbackDO::getMergedId, reqVO.getMergedId())
                .eqIfPresent(FeedbackDO::getUserEnvironment, reqVO.getUserEnvironment())
                .betweenIfPresent(FeedbackDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackDO::getId));
    }

    default List<FeedbackDO> selectList(FeedbackExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<FeedbackDO>()
                .eqIfPresent(FeedbackDO::getProductId, reqVO.getProductId())
                .eqIfPresent(FeedbackDO::getTitle, reqVO.getTitle())
                .eqIfPresent(FeedbackDO::getDetail, reqVO.getDetail())
                .eqIfPresent(FeedbackDO::getFeedbackCategoryId, reqVO.getFeedbackCategoryId())
                .eqIfPresent(FeedbackDO::getRoadmapAdded, reqVO.getRoadmapAdded())
                .eqIfPresent(FeedbackDO::getProgress, reqVO.getProgress())
                .eqIfPresent(FeedbackDO::getStatus, reqVO.getStatus())
                .eqIfPresent(FeedbackDO::getMergedId, reqVO.getMergedId())
                .eqIfPresent(FeedbackDO::getUserEnvironment, reqVO.getUserEnvironment())
                .betweenIfPresent(FeedbackDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackDO::getId));
    }

}
