package cn.iocoder.yudao.module.puu.dal.mysql.feedbackcomment;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcomment.FeedbackCommentDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackcomment.vo.*;

/**
 * 反馈评论 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackCommentMapper extends BaseMapperX<FeedbackCommentDO> {

    default PageResult<FeedbackCommentDO> selectPage(FeedbackCommentPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<FeedbackCommentDO>()
                .eqIfPresent(FeedbackCommentDO::getFeedbackId, reqVO.getFeedbackId())
                .eqIfPresent(FeedbackCommentDO::getContent, reqVO.getContent())
                .eqIfPresent(FeedbackCommentDO::getOfficial, reqVO.getOfficial())
                .betweenIfPresent(FeedbackCommentDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackCommentDO::getId));
    }

    default List<FeedbackCommentDO> selectList(FeedbackCommentExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<FeedbackCommentDO>()
                .eqIfPresent(FeedbackCommentDO::getFeedbackId, reqVO.getFeedbackId())
                .eqIfPresent(FeedbackCommentDO::getContent, reqVO.getContent())
                .eqIfPresent(FeedbackCommentDO::getOfficial, reqVO.getOfficial())
                .betweenIfPresent(FeedbackCommentDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackCommentDO::getId));
    }

}
