package cn.iocoder.yudao.module.puu.service.feedbackcategory;

import java.util.*;
import jakarta.validation.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackcategory.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcategory.FeedbackCategoryDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 反馈分类 Service 接口
 *
 * @author 芋道源码
 */
public interface FeedbackCategoryService {

    /**
     * 创建反馈分类
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createFeedbackCategory(@Valid FeedbackCategoryCreateReqVO createReqVO);

    /**
     * 更新反馈分类
     *
     * @param updateReqVO 更新信息
     */
    void updateFeedbackCategory(@Valid FeedbackCategoryUpdateReqVO updateReqVO);

    /**
     * 删除反馈分类
     *
     * @param id 编号
     */
    void deleteFeedbackCategory(Long id);

    /**
     * 获得反馈分类
     *
     * @param id 编号
     * @return 反馈分类
     */
    FeedbackCategoryDO getFeedbackCategory(Long id);

    /**
     * 获得反馈分类列表
     *
     * @param ids 编号
     * @return 反馈分类列表
     */
    List<FeedbackCategoryDO> getFeedbackCategoryList(Collection<Long> ids);

    /**
     * 获得反馈分类分页
     *
     * @param pageReqVO 分页查询
     * @return 反馈分类分页
     */
    PageResult<FeedbackCategoryDO> getFeedbackCategoryPage(FeedbackCategoryPageReqVO pageReqVO);

    /**
     * 获得反馈分类列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 反馈分类列表
     */
    List<FeedbackCategoryDO> getFeedbackCategoryList(FeedbackCategoryExportReqVO exportReqVO);

}
