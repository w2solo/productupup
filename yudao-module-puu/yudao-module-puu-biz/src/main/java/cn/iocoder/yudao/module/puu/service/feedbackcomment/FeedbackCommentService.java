package cn.iocoder.yudao.module.puu.service.feedbackcomment;

import java.util.*;
import jakarta.validation.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackcomment.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcomment.FeedbackCommentDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 反馈评论 Service 接口
 *
 * @author 芋道源码
 */
public interface FeedbackCommentService {

    /**
     * 创建反馈评论
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createFeedbackComment(@Valid FeedbackCommentCreateReqVO createReqVO);

    /**
     * 更新反馈评论
     *
     * @param updateReqVO 更新信息
     */
    void updateFeedbackComment(@Valid FeedbackCommentUpdateReqVO updateReqVO);

    /**
     * 删除反馈评论
     *
     * @param id 编号
     */
    void deleteFeedbackComment(Long id);

    /**
     * 获得反馈评论
     *
     * @param id 编号
     * @return 反馈评论
     */
    FeedbackCommentDO getFeedbackComment(Long id);

    /**
     * 获得反馈评论列表
     *
     * @param ids 编号
     * @return 反馈评论列表
     */
    List<FeedbackCommentDO> getFeedbackCommentList(Collection<Long> ids);

    /**
     * 获得反馈评论分页
     *
     * @param pageReqVO 分页查询
     * @return 反馈评论分页
     */
    PageResult<FeedbackCommentDO> getFeedbackCommentPage(FeedbackCommentPageReqVO pageReqVO);

    /**
     * 获得反馈评论列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 反馈评论列表
     */
    List<FeedbackCommentDO> getFeedbackCommentList(FeedbackCommentExportReqVO exportReqVO);

}
