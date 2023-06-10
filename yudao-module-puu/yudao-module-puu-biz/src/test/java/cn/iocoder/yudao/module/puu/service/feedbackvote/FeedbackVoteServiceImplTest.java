package cn.iocoder.yudao.module.puu.service.feedbackvote;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import jakarta.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.puu.controller.admin.feedbackvote.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackvote.FeedbackVoteDO;
import cn.iocoder.yudao.module.puu.dal.mysql.feedbackvote.FeedbackVoteMapper;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import jakarta.annotation.Resource;
import org.springframework.context.annotation.Import;
import java.util.*;
import java.time.LocalDateTime;

import static cn.hutool.core.util.RandomUtil.*;
import static cn.iocoder.yudao.module.puu.enums.ErrorCodeConstants.*;
import static cn.iocoder.yudao.framework.test.core.util.AssertUtils.*;
import static cn.iocoder.yudao.framework.test.core.util.RandomUtils.*;
import static cn.iocoder.yudao.framework.common.util.object.ObjectUtils.*;
import static cn.iocoder.yudao.framework.common.util.date.DateUtils.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

/**
* {@link FeedbackVoteServiceImpl} 的单元测试类
*
* @author 芋道源码
*/
@Import(FeedbackVoteServiceImpl.class)
public class FeedbackVoteServiceImplTest extends BaseDbUnitTest {

    @Resource
    private FeedbackVoteServiceImpl feedbackVoteService;

    @Resource
    private FeedbackVoteMapper feedbackVoteMapper;

    @Test
    public void testCreateFeedbackVote_success() {
        // 准备参数
        FeedbackVoteCreateReqVO reqVO = randomPojo(FeedbackVoteCreateReqVO.class);

        // 调用
        Long feedbackVoteId = feedbackVoteService.createFeedbackVote(reqVO);
        // 断言
        assertNotNull(feedbackVoteId);
        // 校验记录的属性是否正确
        FeedbackVoteDO feedbackVote = feedbackVoteMapper.selectById(feedbackVoteId);
        assertPojoEquals(reqVO, feedbackVote);
    }

    @Test
    public void testUpdateFeedbackVote_success() {
        // mock 数据
        FeedbackVoteDO dbFeedbackVote = randomPojo(FeedbackVoteDO.class);
        feedbackVoteMapper.insert(dbFeedbackVote);// @Sql: 先插入出一条存在的数据
        // 准备参数
        FeedbackVoteUpdateReqVO reqVO = randomPojo(FeedbackVoteUpdateReqVO.class, o -> {
            o.setId(dbFeedbackVote.getId()); // 设置更新的 ID
        });

        // 调用
        feedbackVoteService.updateFeedbackVote(reqVO);
        // 校验是否更新正确
        FeedbackVoteDO feedbackVote = feedbackVoteMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, feedbackVote);
    }

    @Test
    public void testUpdateFeedbackVote_notExists() {
        // 准备参数
        FeedbackVoteUpdateReqVO reqVO = randomPojo(FeedbackVoteUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> feedbackVoteService.updateFeedbackVote(reqVO), FEEDBACK_VOTE_NOT_EXISTS);
    }

    @Test
    public void testDeleteFeedbackVote_success() {
        // mock 数据
        FeedbackVoteDO dbFeedbackVote = randomPojo(FeedbackVoteDO.class);
        feedbackVoteMapper.insert(dbFeedbackVote);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbFeedbackVote.getId();

        // 调用
        feedbackVoteService.deleteFeedbackVote(id);
       // 校验数据不存在了
       assertNull(feedbackVoteMapper.selectById(id));
    }

    @Test
    public void testDeleteFeedbackVote_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> feedbackVoteService.deleteFeedbackVote(id), FEEDBACK_VOTE_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetFeedbackVotePage() {
       // mock 数据
       FeedbackVoteDO dbFeedbackVote = randomPojo(FeedbackVoteDO.class, o -> { // 等会查询到
           o.setFeedbackId(null);
           o.setVoteUserId(null);
           o.setCreateTime(null);
       });
       feedbackVoteMapper.insert(dbFeedbackVote);
       // 测试 feedbackId 不匹配
       feedbackVoteMapper.insert(cloneIgnoreId(dbFeedbackVote, o -> o.setFeedbackId(null)));
       // 测试 voteUserId 不匹配
       feedbackVoteMapper.insert(cloneIgnoreId(dbFeedbackVote, o -> o.setVoteUserId(null)));
       // 测试 createTime 不匹配
       feedbackVoteMapper.insert(cloneIgnoreId(dbFeedbackVote, o -> o.setCreateTime(null)));
       // 准备参数
       FeedbackVotePageReqVO reqVO = new FeedbackVotePageReqVO();
       reqVO.setFeedbackId(null);
       reqVO.setVoteUserId(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       PageResult<FeedbackVoteDO> pageResult = feedbackVoteService.getFeedbackVotePage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbFeedbackVote, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetFeedbackVoteList() {
       // mock 数据
       FeedbackVoteDO dbFeedbackVote = randomPojo(FeedbackVoteDO.class, o -> { // 等会查询到
           o.setFeedbackId(null);
           o.setVoteUserId(null);
           o.setCreateTime(null);
       });
       feedbackVoteMapper.insert(dbFeedbackVote);
       // 测试 feedbackId 不匹配
       feedbackVoteMapper.insert(cloneIgnoreId(dbFeedbackVote, o -> o.setFeedbackId(null)));
       // 测试 voteUserId 不匹配
       feedbackVoteMapper.insert(cloneIgnoreId(dbFeedbackVote, o -> o.setVoteUserId(null)));
       // 测试 createTime 不匹配
       feedbackVoteMapper.insert(cloneIgnoreId(dbFeedbackVote, o -> o.setCreateTime(null)));
       // 准备参数
       FeedbackVoteExportReqVO reqVO = new FeedbackVoteExportReqVO();
       reqVO.setFeedbackId(null);
       reqVO.setVoteUserId(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       List<FeedbackVoteDO> list = feedbackVoteService.getFeedbackVoteList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbFeedbackVote, list.get(0));
    }

}
