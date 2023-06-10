package cn.iocoder.yudao.module.puu.service.feedbackcategory;

import org.springframework.stereotype.Service;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackcategory.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcategory.FeedbackCategoryDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.puu.convert.feedbackcategory.FeedbackCategoryConvert;
import cn.iocoder.yudao.module.puu.dal.mysql.feedbackcategory.FeedbackCategoryMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.puu.enums.ErrorCodeConstants.*;

/**
 * 反馈分类 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class FeedbackCategoryServiceImpl implements FeedbackCategoryService {

    @Resource
    private FeedbackCategoryMapper feedbackCategoryMapper;

    @Override
    public Long createFeedbackCategory(FeedbackCategoryCreateReqVO createReqVO) {
        // 插入
        FeedbackCategoryDO feedbackCategory = FeedbackCategoryConvert.INSTANCE.convert(createReqVO);
        feedbackCategoryMapper.insert(feedbackCategory);
        // 返回
        return feedbackCategory.getId();
    }

    @Override
    public void updateFeedbackCategory(FeedbackCategoryUpdateReqVO updateReqVO) {
        // 校验存在
        this.validateFeedbackCategoryExists(updateReqVO.getId());
        // 更新
        FeedbackCategoryDO updateObj = FeedbackCategoryConvert.INSTANCE.convert(updateReqVO);
        feedbackCategoryMapper.updateById(updateObj);
    }

    @Override
    public void deleteFeedbackCategory(Long id) {
        // 校验存在
        this.validateFeedbackCategoryExists(id);
        // 删除
        feedbackCategoryMapper.deleteById(id);
    }

    private void validateFeedbackCategoryExists(Long id) {
        if (feedbackCategoryMapper.selectById(id) == null) {
            throw exception(FEEDBACK_CATEGORY_NOT_EXISTS);
        }
    }

    @Override
    public FeedbackCategoryDO getFeedbackCategory(Long id) {
        return feedbackCategoryMapper.selectById(id);
    }

    @Override
    public List<FeedbackCategoryDO> getFeedbackCategoryList(Collection<Long> ids) {
        return feedbackCategoryMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<FeedbackCategoryDO> getFeedbackCategoryPage(FeedbackCategoryPageReqVO pageReqVO) {
        return feedbackCategoryMapper.selectPage(pageReqVO);
    }

    @Override
    public List<FeedbackCategoryDO> getFeedbackCategoryList(FeedbackCategoryExportReqVO exportReqVO) {
        return feedbackCategoryMapper.selectList(exportReqVO);
    }

}
