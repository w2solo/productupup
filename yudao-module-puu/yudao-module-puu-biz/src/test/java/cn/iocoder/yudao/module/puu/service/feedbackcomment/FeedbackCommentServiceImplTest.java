package cn.iocoder.yudao.module.puu.service.feedbackcomment;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import jakarta.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.puu.controller.admin.feedbackcomment.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcomment.FeedbackCommentDO;
import cn.iocoder.yudao.module.puu.dal.mysql.feedbackcomment.FeedbackCommentMapper;
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
* {@link FeedbackCommentServiceImpl} 的单元测试类
*
* @author 芋道源码
*/
@Import(FeedbackCommentServiceImpl.class)
public class FeedbackCommentServiceImplTest extends BaseDbUnitTest {

    @Resource
    private FeedbackCommentServiceImpl feedbackCommentService;

    @Resource
    private FeedbackCommentMapper feedbackCommentMapper;

    @Test
    public void testCreateFeedbackComment_success() {
        // 准备参数
        FeedbackCommentCreateReqVO reqVO = randomPojo(FeedbackCommentCreateReqVO.class);

        // 调用
        Long feedbackCommentId = feedbackCommentService.createFeedbackComment(reqVO);
        // 断言
        assertNotNull(feedbackCommentId);
        // 校验记录的属性是否正确
        FeedbackCommentDO feedbackComment = feedbackCommentMapper.selectById(feedbackCommentId);
        assertPojoEquals(reqVO, feedbackComment);
    }

    @Test
    public void testUpdateFeedbackComment_success() {
        // mock 数据
        FeedbackCommentDO dbFeedbackComment = randomPojo(FeedbackCommentDO.class);
        feedbackCommentMapper.insert(dbFeedbackComment);// @Sql: 先插入出一条存在的数据
        // 准备参数
        FeedbackCommentUpdateReqVO reqVO = randomPojo(FeedbackCommentUpdateReqVO.class, o -> {
            o.setId(dbFeedbackComment.getId()); // 设置更新的 ID
        });

        // 调用
        feedbackCommentService.updateFeedbackComment(reqVO);
        // 校验是否更新正确
        FeedbackCommentDO feedbackComment = feedbackCommentMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, feedbackComment);
    }

    @Test
    public void testUpdateFeedbackComment_notExists() {
        // 准备参数
        FeedbackCommentUpdateReqVO reqVO = randomPojo(FeedbackCommentUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> feedbackCommentService.updateFeedbackComment(reqVO), FEEDBACK_COMMENT_NOT_EXISTS);
    }

    @Test
    public void testDeleteFeedbackComment_success() {
        // mock 数据
        FeedbackCommentDO dbFeedbackComment = randomPojo(FeedbackCommentDO.class);
        feedbackCommentMapper.insert(dbFeedbackComment);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbFeedbackComment.getId();

        // 调用
        feedbackCommentService.deleteFeedbackComment(id);
       // 校验数据不存在了
       assertNull(feedbackCommentMapper.selectById(id));
    }

    @Test
    public void testDeleteFeedbackComment_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> feedbackCommentService.deleteFeedbackComment(id), FEEDBACK_COMMENT_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetFeedbackCommentPage() {
       // mock 数据
       FeedbackCommentDO dbFeedbackComment = randomPojo(FeedbackCommentDO.class, o -> { // 等会查询到
           o.setFeedbackId(null);
           o.setContent(null);
           o.setOfficial(null);
           o.setCreateTime(null);
       });
       feedbackCommentMapper.insert(dbFeedbackComment);
       // 测试 feedbackId 不匹配
       feedbackCommentMapper.insert(cloneIgnoreId(dbFeedbackComment, o -> o.setFeedbackId(null)));
       // 测试 content 不匹配
       feedbackCommentMapper.insert(cloneIgnoreId(dbFeedbackComment, o -> o.setContent(null)));
       // 测试 official 不匹配
       feedbackCommentMapper.insert(cloneIgnoreId(dbFeedbackComment, o -> o.setOfficial(null)));
       // 测试 createTime 不匹配
       feedbackCommentMapper.insert(cloneIgnoreId(dbFeedbackComment, o -> o.setCreateTime(null)));
       // 准备参数
       FeedbackCommentPageReqVO reqVO = new FeedbackCommentPageReqVO();
       reqVO.setFeedbackId(null);
       reqVO.setContent(null);
       reqVO.setOfficial(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       PageResult<FeedbackCommentDO> pageResult = feedbackCommentService.getFeedbackCommentPage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbFeedbackComment, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetFeedbackCommentList() {
       // mock 数据
       FeedbackCommentDO dbFeedbackComment = randomPojo(FeedbackCommentDO.class, o -> { // 等会查询到
           o.setFeedbackId(null);
           o.setContent(null);
           o.setOfficial(null);
           o.setCreateTime(null);
       });
       feedbackCommentMapper.insert(dbFeedbackComment);
       // 测试 feedbackId 不匹配
       feedbackCommentMapper.insert(cloneIgnoreId(dbFeedbackComment, o -> o.setFeedbackId(null)));
       // 测试 content 不匹配
       feedbackCommentMapper.insert(cloneIgnoreId(dbFeedbackComment, o -> o.setContent(null)));
       // 测试 official 不匹配
       feedbackCommentMapper.insert(cloneIgnoreId(dbFeedbackComment, o -> o.setOfficial(null)));
       // 测试 createTime 不匹配
       feedbackCommentMapper.insert(cloneIgnoreId(dbFeedbackComment, o -> o.setCreateTime(null)));
       // 准备参数
       FeedbackCommentExportReqVO reqVO = new FeedbackCommentExportReqVO();
       reqVO.setFeedbackId(null);
       reqVO.setContent(null);
       reqVO.setOfficial(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       List<FeedbackCommentDO> list = feedbackCommentService.getFeedbackCommentList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbFeedbackComment, list.get(0));
    }

}
