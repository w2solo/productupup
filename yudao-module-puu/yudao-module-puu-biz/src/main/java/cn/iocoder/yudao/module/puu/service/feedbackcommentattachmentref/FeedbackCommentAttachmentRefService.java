package cn.iocoder.yudao.module.puu.service.feedbackcommentattachmentref;

import java.util.*;
import jakarta.validation.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackcommentattachmentref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcommentattachmentref.FeedbackCommentAttachmentRefDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 评论附件，多堆多 Service 接口
 *
 * @author 芋道源码
 */
public interface FeedbackCommentAttachmentRefService {

    /**
     * 创建评论附件，多堆多
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createFeedbackCommentAttachmentRef(@Valid FeedbackCommentAttachmentRefCreateReqVO createReqVO);

    /**
     * 更新评论附件，多堆多
     *
     * @param updateReqVO 更新信息
     */
    void updateFeedbackCommentAttachmentRef(@Valid FeedbackCommentAttachmentRefUpdateReqVO updateReqVO);

    /**
     * 删除评论附件，多堆多
     *
     * @param id 编号
     */
    void deleteFeedbackCommentAttachmentRef(Long id);

    /**
     * 获得评论附件，多堆多
     *
     * @param id 编号
     * @return 评论附件，多堆多
     */
    FeedbackCommentAttachmentRefDO getFeedbackCommentAttachmentRef(Long id);

    /**
     * 获得评论附件，多堆多列表
     *
     * @param ids 编号
     * @return 评论附件，多堆多列表
     */
    List<FeedbackCommentAttachmentRefDO> getFeedbackCommentAttachmentRefList(Collection<Long> ids);

    /**
     * 获得评论附件，多堆多分页
     *
     * @param pageReqVO 分页查询
     * @return 评论附件，多堆多分页
     */
    PageResult<FeedbackCommentAttachmentRefDO> getFeedbackCommentAttachmentRefPage(FeedbackCommentAttachmentRefPageReqVO pageReqVO);

    /**
     * 获得评论附件，多堆多列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 评论附件，多堆多列表
     */
    List<FeedbackCommentAttachmentRefDO> getFeedbackCommentAttachmentRefList(FeedbackCommentAttachmentRefExportReqVO exportReqVO);

}
