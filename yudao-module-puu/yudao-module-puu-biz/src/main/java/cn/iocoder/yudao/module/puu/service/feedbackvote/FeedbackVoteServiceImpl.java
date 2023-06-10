package cn.iocoder.yudao.module.puu.service.feedbackvote;

import org.springframework.stereotype.Service;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackvote.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackvote.FeedbackVoteDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.puu.convert.feedbackvote.FeedbackVoteConvert;
import cn.iocoder.yudao.module.puu.dal.mysql.feedbackvote.FeedbackVoteMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.puu.enums.ErrorCodeConstants.*;

/**
 * 反馈投票 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class FeedbackVoteServiceImpl implements FeedbackVoteService {

    @Resource
    private FeedbackVoteMapper feedbackVoteMapper;

    @Override
    public Long createFeedbackVote(FeedbackVoteCreateReqVO createReqVO) {
        // 插入
        FeedbackVoteDO feedbackVote = FeedbackVoteConvert.INSTANCE.convert(createReqVO);
        feedbackVoteMapper.insert(feedbackVote);
        // 返回
        return feedbackVote.getId();
    }

    @Override
    public void updateFeedbackVote(FeedbackVoteUpdateReqVO updateReqVO) {
        // 校验存在
        this.validateFeedbackVoteExists(updateReqVO.getId());
        // 更新
        FeedbackVoteDO updateObj = FeedbackVoteConvert.INSTANCE.convert(updateReqVO);
        feedbackVoteMapper.updateById(updateObj);
    }

    @Override
    public void deleteFeedbackVote(Long id) {
        // 校验存在
        this.validateFeedbackVoteExists(id);
        // 删除
        feedbackVoteMapper.deleteById(id);
    }

    private void validateFeedbackVoteExists(Long id) {
        if (feedbackVoteMapper.selectById(id) == null) {
            throw exception(FEEDBACK_VOTE_NOT_EXISTS);
        }
    }

    @Override
    public FeedbackVoteDO getFeedbackVote(Long id) {
        return feedbackVoteMapper.selectById(id);
    }

    @Override
    public List<FeedbackVoteDO> getFeedbackVoteList(Collection<Long> ids) {
        return feedbackVoteMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<FeedbackVoteDO> getFeedbackVotePage(FeedbackVotePageReqVO pageReqVO) {
        return feedbackVoteMapper.selectPage(pageReqVO);
    }

    @Override
    public List<FeedbackVoteDO> getFeedbackVoteList(FeedbackVoteExportReqVO exportReqVO) {
        return feedbackVoteMapper.selectList(exportReqVO);
    }

}
