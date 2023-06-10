package cn.iocoder.yudao.module.puu.service.feedbacktagref;

import org.springframework.stereotype.Service;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbacktagref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbacktagref.FeedbackTagRefDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.puu.convert.feedbacktagref.FeedbackTagRefConvert;
import cn.iocoder.yudao.module.puu.dal.mysql.feedbacktagref.FeedbackTagRefMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.puu.enums.ErrorCodeConstants.*;

/**
 * 反馈的标签，多堆多 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class FeedbackTagRefServiceImpl implements FeedbackTagRefService {

    @Resource
    private FeedbackTagRefMapper feedbackTagRefMapper;

    @Override
    public Long createFeedbackTagRef(FeedbackTagRefCreateReqVO createReqVO) {
        // 插入
        FeedbackTagRefDO feedbackTagRef = FeedbackTagRefConvert.INSTANCE.convert(createReqVO);
        feedbackTagRefMapper.insert(feedbackTagRef);
        // 返回
        return feedbackTagRef.getId();
    }

    @Override
    public void updateFeedbackTagRef(FeedbackTagRefUpdateReqVO updateReqVO) {
        // 校验存在
        this.validateFeedbackTagRefExists(updateReqVO.getId());
        // 更新
        FeedbackTagRefDO updateObj = FeedbackTagRefConvert.INSTANCE.convert(updateReqVO);
        feedbackTagRefMapper.updateById(updateObj);
    }

    @Override
    public void deleteFeedbackTagRef(Long id) {
        // 校验存在
        this.validateFeedbackTagRefExists(id);
        // 删除
        feedbackTagRefMapper.deleteById(id);
    }

    private void validateFeedbackTagRefExists(Long id) {
        if (feedbackTagRefMapper.selectById(id) == null) {
            throw exception(FEEDBACK_TAG_REF_NOT_EXISTS);
        }
    }

    @Override
    public FeedbackTagRefDO getFeedbackTagRef(Long id) {
        return feedbackTagRefMapper.selectById(id);
    }

    @Override
    public List<FeedbackTagRefDO> getFeedbackTagRefList(Collection<Long> ids) {
        return feedbackTagRefMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<FeedbackTagRefDO> getFeedbackTagRefPage(FeedbackTagRefPageReqVO pageReqVO) {
        return feedbackTagRefMapper.selectPage(pageReqVO);
    }

    @Override
    public List<FeedbackTagRefDO> getFeedbackTagRefList(FeedbackTagRefExportReqVO exportReqVO) {
        return feedbackTagRefMapper.selectList(exportReqVO);
    }

}
