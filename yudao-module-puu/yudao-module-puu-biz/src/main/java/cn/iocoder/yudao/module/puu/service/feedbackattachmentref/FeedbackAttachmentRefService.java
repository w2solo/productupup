package cn.iocoder.yudao.module.puu.service.feedbackattachmentref;

import java.util.*;
import jakarta.validation.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackattachmentref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackattachmentref.FeedbackAttachmentRefDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 反馈关联的文件，多堆多 Service 接口
 *
 * @author 芋道源码
 */
public interface FeedbackAttachmentRefService {

    /**
     * 创建反馈关联的文件，多堆多
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createFeedbackAttachmentRef(@Valid FeedbackAttachmentRefCreateReqVO createReqVO);

    /**
     * 更新反馈关联的文件，多堆多
     *
     * @param updateReqVO 更新信息
     */
    void updateFeedbackAttachmentRef(@Valid FeedbackAttachmentRefUpdateReqVO updateReqVO);

    /**
     * 删除反馈关联的文件，多堆多
     *
     * @param id 编号
     */
    void deleteFeedbackAttachmentRef(Long id);

    /**
     * 获得反馈关联的文件，多堆多
     *
     * @param id 编号
     * @return 反馈关联的文件，多堆多
     */
    FeedbackAttachmentRefDO getFeedbackAttachmentRef(Long id);

    /**
     * 获得反馈关联的文件，多堆多列表
     *
     * @param ids 编号
     * @return 反馈关联的文件，多堆多列表
     */
    List<FeedbackAttachmentRefDO> getFeedbackAttachmentRefList(Collection<Long> ids);

    /**
     * 获得反馈关联的文件，多堆多分页
     *
     * @param pageReqVO 分页查询
     * @return 反馈关联的文件，多堆多分页
     */
    PageResult<FeedbackAttachmentRefDO> getFeedbackAttachmentRefPage(FeedbackAttachmentRefPageReqVO pageReqVO);

    /**
     * 获得反馈关联的文件，多堆多列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 反馈关联的文件，多堆多列表
     */
    List<FeedbackAttachmentRefDO> getFeedbackAttachmentRefList(FeedbackAttachmentRefExportReqVO exportReqVO);

}
