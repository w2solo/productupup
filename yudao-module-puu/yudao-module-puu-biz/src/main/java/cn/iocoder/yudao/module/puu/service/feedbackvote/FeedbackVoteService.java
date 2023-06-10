package cn.iocoder.yudao.module.puu.service.feedbackvote;

import java.util.*;
import jakarta.validation.*;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackvote.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackvote.FeedbackVoteDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 反馈投票 Service 接口
 *
 * @author 芋道源码
 */
public interface FeedbackVoteService {

    /**
     * 创建反馈投票
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createFeedbackVote(@Valid FeedbackVoteCreateReqVO createReqVO);

    /**
     * 更新反馈投票
     *
     * @param updateReqVO 更新信息
     */
    void updateFeedbackVote(@Valid FeedbackVoteUpdateReqVO updateReqVO);

    /**
     * 删除反馈投票
     *
     * @param id 编号
     */
    void deleteFeedbackVote(Long id);

    /**
     * 获得反馈投票
     *
     * @param id 编号
     * @return 反馈投票
     */
    FeedbackVoteDO getFeedbackVote(Long id);

    /**
     * 获得反馈投票列表
     *
     * @param ids 编号
     * @return 反馈投票列表
     */
    List<FeedbackVoteDO> getFeedbackVoteList(Collection<Long> ids);

    /**
     * 获得反馈投票分页
     *
     * @param pageReqVO 分页查询
     * @return 反馈投票分页
     */
    PageResult<FeedbackVoteDO> getFeedbackVotePage(FeedbackVotePageReqVO pageReqVO);

    /**
     * 获得反馈投票列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 反馈投票列表
     */
    List<FeedbackVoteDO> getFeedbackVoteList(FeedbackVoteExportReqVO exportReqVO);

}
