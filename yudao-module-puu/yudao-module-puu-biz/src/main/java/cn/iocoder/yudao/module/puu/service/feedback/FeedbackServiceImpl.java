package cn.iocoder.yudao.module.puu.service.feedback;

import org.springframework.stereotype.Service;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedback.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedback.FeedbackDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.puu.convert.feedback.FeedbackConvert;
import cn.iocoder.yudao.module.puu.dal.mysql.feedback.FeedbackMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.puu.enums.ErrorCodeConstants.*;

/**
 * 反馈 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class FeedbackServiceImpl implements FeedbackService {

    @Resource
    private FeedbackMapper feedbackMapper;

    @Override
    public Long createFeedback(FeedbackCreateReqVO createReqVO) {
        // 插入
        FeedbackDO feedback = FeedbackConvert.INSTANCE.convert(createReqVO);
        feedbackMapper.insert(feedback);
        // 返回
        return feedback.getId();
    }

    @Override
    public void updateFeedback(FeedbackUpdateReqVO updateReqVO) {
        // 校验存在
        this.validateFeedbackExists(updateReqVO.getId());
        // 更新
        FeedbackDO updateObj = FeedbackConvert.INSTANCE.convert(updateReqVO);
        feedbackMapper.updateById(updateObj);
    }

    @Override
    public void deleteFeedback(Long id) {
        // 校验存在
        this.validateFeedbackExists(id);
        // 删除
        feedbackMapper.deleteById(id);
    }

    private void validateFeedbackExists(Long id) {
        if (feedbackMapper.selectById(id) == null) {
            throw exception(FEEDBACK_NOT_EXISTS);
        }
    }

    @Override
    public FeedbackDO getFeedback(Long id) {
        return feedbackMapper.selectById(id);
    }

    @Override
    public List<FeedbackDO> getFeedbackList(Collection<Long> ids) {
        return feedbackMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<FeedbackDO> getFeedbackPage(FeedbackPageReqVO pageReqVO) {
        return feedbackMapper.selectPage(pageReqVO);
    }

    @Override
    public List<FeedbackDO> getFeedbackList(FeedbackExportReqVO exportReqVO) {
        return feedbackMapper.selectList(exportReqVO);
    }

}
