package cn.iocoder.yudao.module.puu.service.feedbacktag;

import java.util.*;
import jakarta.validation.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbacktag.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbacktag.FeedbackTagDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 反馈标签 Service 接口
 *
 * @author 芋道源码
 */
public interface FeedbackTagService {

    /**
     * 创建反馈标签
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createFeedbackTag(@Valid FeedbackTagCreateReqVO createReqVO);

    /**
     * 更新反馈标签
     *
     * @param updateReqVO 更新信息
     */
    void updateFeedbackTag(@Valid FeedbackTagUpdateReqVO updateReqVO);

    /**
     * 删除反馈标签
     *
     * @param id 编号
     */
    void deleteFeedbackTag(Long id);

    /**
     * 获得反馈标签
     *
     * @param id 编号
     * @return 反馈标签
     */
    FeedbackTagDO getFeedbackTag(Long id);

    /**
     * 获得反馈标签列表
     *
     * @param ids 编号
     * @return 反馈标签列表
     */
    List<FeedbackTagDO> getFeedbackTagList(Collection<Long> ids);

    /**
     * 获得反馈标签分页
     *
     * @param pageReqVO 分页查询
     * @return 反馈标签分页
     */
    PageResult<FeedbackTagDO> getFeedbackTagPage(FeedbackTagPageReqVO pageReqVO);

    /**
     * 获得反馈标签列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 反馈标签列表
     */
    List<FeedbackTagDO> getFeedbackTagList(FeedbackTagExportReqVO exportReqVO);

}
