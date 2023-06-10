package cn.iocoder.yudao.module.puu.service.feedbackcomment;

import org.springframework.stereotype.Service;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackcomment.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcomment.FeedbackCommentDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.puu.convert.feedbackcomment.FeedbackCommentConvert;
import cn.iocoder.yudao.module.puu.dal.mysql.feedbackcomment.FeedbackCommentMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.puu.enums.ErrorCodeConstants.*;

/**
 * 反馈评论 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class FeedbackCommentServiceImpl implements FeedbackCommentService {

    @Resource
    private FeedbackCommentMapper feedbackCommentMapper;

    @Override
    public Long createFeedbackComment(FeedbackCommentCreateReqVO createReqVO) {
        // 插入
        FeedbackCommentDO feedbackComment = FeedbackCommentConvert.INSTANCE.convert(createReqVO);
        feedbackCommentMapper.insert(feedbackComment);
        // 返回
        return feedbackComment.getId();
    }

    @Override
    public void updateFeedbackComment(FeedbackCommentUpdateReqVO updateReqVO) {
        // 校验存在
        this.validateFeedbackCommentExists(updateReqVO.getId());
        // 更新
        FeedbackCommentDO updateObj = FeedbackCommentConvert.INSTANCE.convert(updateReqVO);
        feedbackCommentMapper.updateById(updateObj);
    }

    @Override
    public void deleteFeedbackComment(Long id) {
        // 校验存在
        this.validateFeedbackCommentExists(id);
        // 删除
        feedbackCommentMapper.deleteById(id);
    }

    private void validateFeedbackCommentExists(Long id) {
        if (feedbackCommentMapper.selectById(id) == null) {
            throw exception(FEEDBACK_COMMENT_NOT_EXISTS);
        }
    }

    @Override
    public FeedbackCommentDO getFeedbackComment(Long id) {
        return feedbackCommentMapper.selectById(id);
    }

    @Override
    public List<FeedbackCommentDO> getFeedbackCommentList(Collection<Long> ids) {
        return feedbackCommentMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<FeedbackCommentDO> getFeedbackCommentPage(FeedbackCommentPageReqVO pageReqVO) {
        return feedbackCommentMapper.selectPage(pageReqVO);
    }

    @Override
    public List<FeedbackCommentDO> getFeedbackCommentList(FeedbackCommentExportReqVO exportReqVO) {
        return feedbackCommentMapper.selectList(exportReqVO);
    }

}
