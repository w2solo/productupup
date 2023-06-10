package cn.iocoder.yudao.module.puu.service.feedbackcommentattachmentref;

import org.springframework.stereotype.Service;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackcommentattachmentref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcommentattachmentref.FeedbackCommentAttachmentRefDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.puu.convert.feedbackcommentattachmentref.FeedbackCommentAttachmentRefConvert;
import cn.iocoder.yudao.module.puu.dal.mysql.feedbackcommentattachmentref.FeedbackCommentAttachmentRefMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.puu.enums.ErrorCodeConstants.*;

/**
 * 评论附件，多堆多 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class FeedbackCommentAttachmentRefServiceImpl implements FeedbackCommentAttachmentRefService {

    @Resource
    private FeedbackCommentAttachmentRefMapper feedbackCommentAttachmentRefMapper;

    @Override
    public Long createFeedbackCommentAttachmentRef(FeedbackCommentAttachmentRefCreateReqVO createReqVO) {
        // 插入
        FeedbackCommentAttachmentRefDO feedbackCommentAttachmentRef = FeedbackCommentAttachmentRefConvert.INSTANCE.convert(createReqVO);
        feedbackCommentAttachmentRefMapper.insert(feedbackCommentAttachmentRef);
        // 返回
        return feedbackCommentAttachmentRef.getId();
    }

    @Override
    public void updateFeedbackCommentAttachmentRef(FeedbackCommentAttachmentRefUpdateReqVO updateReqVO) {
        // 校验存在
        this.validateFeedbackCommentAttachmentRefExists(updateReqVO.getId());
        // 更新
        FeedbackCommentAttachmentRefDO updateObj = FeedbackCommentAttachmentRefConvert.INSTANCE.convert(updateReqVO);
        feedbackCommentAttachmentRefMapper.updateById(updateObj);
    }

    @Override
    public void deleteFeedbackCommentAttachmentRef(Long id) {
        // 校验存在
        this.validateFeedbackCommentAttachmentRefExists(id);
        // 删除
        feedbackCommentAttachmentRefMapper.deleteById(id);
    }

    private void validateFeedbackCommentAttachmentRefExists(Long id) {
        if (feedbackCommentAttachmentRefMapper.selectById(id) == null) {
            throw exception(FEEDBACK_COMMENT_ATTACHMENT_REF_NOT_EXISTS);
        }
    }

    @Override
    public FeedbackCommentAttachmentRefDO getFeedbackCommentAttachmentRef(Long id) {
        return feedbackCommentAttachmentRefMapper.selectById(id);
    }

    @Override
    public List<FeedbackCommentAttachmentRefDO> getFeedbackCommentAttachmentRefList(Collection<Long> ids) {
        return feedbackCommentAttachmentRefMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<FeedbackCommentAttachmentRefDO> getFeedbackCommentAttachmentRefPage(FeedbackCommentAttachmentRefPageReqVO pageReqVO) {
        return feedbackCommentAttachmentRefMapper.selectPage(pageReqVO);
    }

    @Override
    public List<FeedbackCommentAttachmentRefDO> getFeedbackCommentAttachmentRefList(FeedbackCommentAttachmentRefExportReqVO exportReqVO) {
        return feedbackCommentAttachmentRefMapper.selectList(exportReqVO);
    }

}
