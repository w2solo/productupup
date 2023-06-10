package cn.iocoder.yudao.module.puu.service.feedbackattachmentref;

import org.springframework.stereotype.Service;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackattachmentref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackattachmentref.FeedbackAttachmentRefDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.puu.convert.feedbackattachmentref.FeedbackAttachmentRefConvert;
import cn.iocoder.yudao.module.puu.dal.mysql.feedbackattachmentref.FeedbackAttachmentRefMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.puu.enums.ErrorCodeConstants.*;

/**
 * 反馈关联的文件，多堆多 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class FeedbackAttachmentRefServiceImpl implements FeedbackAttachmentRefService {

    @Resource
    private FeedbackAttachmentRefMapper feedbackAttachmentRefMapper;

    @Override
    public Long createFeedbackAttachmentRef(FeedbackAttachmentRefCreateReqVO createReqVO) {
        // 插入
        FeedbackAttachmentRefDO feedbackAttachmentRef = FeedbackAttachmentRefConvert.INSTANCE.convert(createReqVO);
        feedbackAttachmentRefMapper.insert(feedbackAttachmentRef);
        // 返回
        return feedbackAttachmentRef.getId();
    }

    @Override
    public void updateFeedbackAttachmentRef(FeedbackAttachmentRefUpdateReqVO updateReqVO) {
        // 校验存在
        this.validateFeedbackAttachmentRefExists(updateReqVO.getId());
        // 更新
        FeedbackAttachmentRefDO updateObj = FeedbackAttachmentRefConvert.INSTANCE.convert(updateReqVO);
        feedbackAttachmentRefMapper.updateById(updateObj);
    }

    @Override
    public void deleteFeedbackAttachmentRef(Long id) {
        // 校验存在
        this.validateFeedbackAttachmentRefExists(id);
        // 删除
        feedbackAttachmentRefMapper.deleteById(id);
    }

    private void validateFeedbackAttachmentRefExists(Long id) {
        if (feedbackAttachmentRefMapper.selectById(id) == null) {
            throw exception(FEEDBACK_ATTACHMENT_REF_NOT_EXISTS);
        }
    }

    @Override
    public FeedbackAttachmentRefDO getFeedbackAttachmentRef(Long id) {
        return feedbackAttachmentRefMapper.selectById(id);
    }

    @Override
    public List<FeedbackAttachmentRefDO> getFeedbackAttachmentRefList(Collection<Long> ids) {
        return feedbackAttachmentRefMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<FeedbackAttachmentRefDO> getFeedbackAttachmentRefPage(FeedbackAttachmentRefPageReqVO pageReqVO) {
        return feedbackAttachmentRefMapper.selectPage(pageReqVO);
    }

    @Override
    public List<FeedbackAttachmentRefDO> getFeedbackAttachmentRefList(FeedbackAttachmentRefExportReqVO exportReqVO) {
        return feedbackAttachmentRefMapper.selectList(exportReqVO);
    }

}
