package cn.iocoder.yudao.module.puu.service.feedbacktagref;

import java.util.*;
import jakarta.validation.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbacktagref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbacktagref.FeedbackTagRefDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 反馈的标签，多堆多 Service 接口
 *
 * @author 芋道源码
 */
public interface FeedbackTagRefService {

    /**
     * 创建反馈的标签，多堆多
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createFeedbackTagRef(@Valid FeedbackTagRefCreateReqVO createReqVO);

    /**
     * 更新反馈的标签，多堆多
     *
     * @param updateReqVO 更新信息
     */
    void updateFeedbackTagRef(@Valid FeedbackTagRefUpdateReqVO updateReqVO);

    /**
     * 删除反馈的标签，多堆多
     *
     * @param id 编号
     */
    void deleteFeedbackTagRef(Long id);

    /**
     * 获得反馈的标签，多堆多
     *
     * @param id 编号
     * @return 反馈的标签，多堆多
     */
    FeedbackTagRefDO getFeedbackTagRef(Long id);

    /**
     * 获得反馈的标签，多堆多列表
     *
     * @param ids 编号
     * @return 反馈的标签，多堆多列表
     */
    List<FeedbackTagRefDO> getFeedbackTagRefList(Collection<Long> ids);

    /**
     * 获得反馈的标签，多堆多分页
     *
     * @param pageReqVO 分页查询
     * @return 反馈的标签，多堆多分页
     */
    PageResult<FeedbackTagRefDO> getFeedbackTagRefPage(FeedbackTagRefPageReqVO pageReqVO);

    /**
     * 获得反馈的标签，多堆多列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 反馈的标签，多堆多列表
     */
    List<FeedbackTagRefDO> getFeedbackTagRefList(FeedbackTagRefExportReqVO exportReqVO);

}
