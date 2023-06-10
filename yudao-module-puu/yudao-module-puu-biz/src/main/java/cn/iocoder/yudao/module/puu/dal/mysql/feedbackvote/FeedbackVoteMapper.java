package cn.iocoder.yudao.module.puu.dal.mysql.feedbackvote;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackvote.FeedbackVoteDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackvote.vo.*;

/**
 * 反馈投票 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackVoteMapper extends BaseMapperX<FeedbackVoteDO> {

    default PageResult<FeedbackVoteDO> selectPage(FeedbackVotePageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<FeedbackVoteDO>()
                .eqIfPresent(FeedbackVoteDO::getFeedbackId, reqVO.getFeedbackId())
                .eqIfPresent(FeedbackVoteDO::getVoteUserId, reqVO.getVoteUserId())
                .betweenIfPresent(FeedbackVoteDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackVoteDO::getId));
    }

    default List<FeedbackVoteDO> selectList(FeedbackVoteExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<FeedbackVoteDO>()
                .eqIfPresent(FeedbackVoteDO::getFeedbackId, reqVO.getFeedbackId())
                .eqIfPresent(FeedbackVoteDO::getVoteUserId, reqVO.getVoteUserId())
                .betweenIfPresent(FeedbackVoteDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackVoteDO::getId));
    }

}
