package cn.iocoder.yudao.module.puu.dal.mysql.feedbackcommentattachmentref;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcommentattachmentref.FeedbackCommentAttachmentRefDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackcommentattachmentref.vo.*;

/**
 * 评论附件，多堆多 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackCommentAttachmentRefMapper extends BaseMapperX<FeedbackCommentAttachmentRefDO> {

    default PageResult<FeedbackCommentAttachmentRefDO> selectPage(FeedbackCommentAttachmentRefPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<FeedbackCommentAttachmentRefDO>()
                .eqIfPresent(FeedbackCommentAttachmentRefDO::getFeedbackCommentId, reqVO.getFeedbackCommentId())
                .eqIfPresent(FeedbackCommentAttachmentRefDO::getAttachmentId, reqVO.getAttachmentId())
                .betweenIfPresent(FeedbackCommentAttachmentRefDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackCommentAttachmentRefDO::getId));
    }

    default List<FeedbackCommentAttachmentRefDO> selectList(FeedbackCommentAttachmentRefExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<FeedbackCommentAttachmentRefDO>()
                .eqIfPresent(FeedbackCommentAttachmentRefDO::getFeedbackCommentId, reqVO.getFeedbackCommentId())
                .eqIfPresent(FeedbackCommentAttachmentRefDO::getAttachmentId, reqVO.getAttachmentId())
                .betweenIfPresent(FeedbackCommentAttachmentRefDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackCommentAttachmentRefDO::getId));
    }

}
