package cn.iocoder.yudao.module.puu.service.feedbackcommentattachmentref;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import jakarta.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.puu.controller.admin.feedbackcommentattachmentref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcommentattachmentref.FeedbackCommentAttachmentRefDO;
import cn.iocoder.yudao.module.puu.dal.mysql.feedbackcommentattachmentref.FeedbackCommentAttachmentRefMapper;
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
* {@link FeedbackCommentAttachmentRefServiceImpl} 的单元测试类
*
* @author 芋道源码
*/
@Import(FeedbackCommentAttachmentRefServiceImpl.class)
public class FeedbackCommentAttachmentRefServiceImplTest extends BaseDbUnitTest {

    @Resource
    private FeedbackCommentAttachmentRefServiceImpl feedbackCommentAttachmentRefService;

    @Resource
    private FeedbackCommentAttachmentRefMapper feedbackCommentAttachmentRefMapper;

    @Test
    public void testCreateFeedbackCommentAttachmentRef_success() {
        // 准备参数
        FeedbackCommentAttachmentRefCreateReqVO reqVO = randomPojo(FeedbackCommentAttachmentRefCreateReqVO.class);

        // 调用
        Long feedbackCommentAttachmentRefId = feedbackCommentAttachmentRefService.createFeedbackCommentAttachmentRef(reqVO);
        // 断言
        assertNotNull(feedbackCommentAttachmentRefId);
        // 校验记录的属性是否正确
        FeedbackCommentAttachmentRefDO feedbackCommentAttachmentRef = feedbackCommentAttachmentRefMapper.selectById(feedbackCommentAttachmentRefId);
        assertPojoEquals(reqVO, feedbackCommentAttachmentRef);
    }

    @Test
    public void testUpdateFeedbackCommentAttachmentRef_success() {
        // mock 数据
        FeedbackCommentAttachmentRefDO dbFeedbackCommentAttachmentRef = randomPojo(FeedbackCommentAttachmentRefDO.class);
        feedbackCommentAttachmentRefMapper.insert(dbFeedbackCommentAttachmentRef);// @Sql: 先插入出一条存在的数据
        // 准备参数
        FeedbackCommentAttachmentRefUpdateReqVO reqVO = randomPojo(FeedbackCommentAttachmentRefUpdateReqVO.class, o -> {
            o.setId(dbFeedbackCommentAttachmentRef.getId()); // 设置更新的 ID
        });

        // 调用
        feedbackCommentAttachmentRefService.updateFeedbackCommentAttachmentRef(reqVO);
        // 校验是否更新正确
        FeedbackCommentAttachmentRefDO feedbackCommentAttachmentRef = feedbackCommentAttachmentRefMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, feedbackCommentAttachmentRef);
    }

    @Test
    public void testUpdateFeedbackCommentAttachmentRef_notExists() {
        // 准备参数
        FeedbackCommentAttachmentRefUpdateReqVO reqVO = randomPojo(FeedbackCommentAttachmentRefUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> feedbackCommentAttachmentRefService.updateFeedbackCommentAttachmentRef(reqVO), FEEDBACK_COMMENT_ATTACHMENT_REF_NOT_EXISTS);
    }

    @Test
    public void testDeleteFeedbackCommentAttachmentRef_success() {
        // mock 数据
        FeedbackCommentAttachmentRefDO dbFeedbackCommentAttachmentRef = randomPojo(FeedbackCommentAttachmentRefDO.class);
        feedbackCommentAttachmentRefMapper.insert(dbFeedbackCommentAttachmentRef);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbFeedbackCommentAttachmentRef.getId();

        // 调用
        feedbackCommentAttachmentRefService.deleteFeedbackCommentAttachmentRef(id);
       // 校验数据不存在了
       assertNull(feedbackCommentAttachmentRefMapper.selectById(id));
    }

    @Test
    public void testDeleteFeedbackCommentAttachmentRef_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> feedbackCommentAttachmentRefService.deleteFeedbackCommentAttachmentRef(id), FEEDBACK_COMMENT_ATTACHMENT_REF_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetFeedbackCommentAttachmentRefPage() {
       // mock 数据
       FeedbackCommentAttachmentRefDO dbFeedbackCommentAttachmentRef = randomPojo(FeedbackCommentAttachmentRefDO.class, o -> { // 等会查询到
           o.setFeedbackCommentId(null);
           o.setAttachmentId(null);
           o.setCreateTime(null);
       });
       feedbackCommentAttachmentRefMapper.insert(dbFeedbackCommentAttachmentRef);
       // 测试 feedbackCommentId 不匹配
       feedbackCommentAttachmentRefMapper.insert(cloneIgnoreId(dbFeedbackCommentAttachmentRef, o -> o.setFeedbackCommentId(null)));
       // 测试 attachmentId 不匹配
       feedbackCommentAttachmentRefMapper.insert(cloneIgnoreId(dbFeedbackCommentAttachmentRef, o -> o.setAttachmentId(null)));
       // 测试 createTime 不匹配
       feedbackCommentAttachmentRefMapper.insert(cloneIgnoreId(dbFeedbackCommentAttachmentRef, o -> o.setCreateTime(null)));
       // 准备参数
       FeedbackCommentAttachmentRefPageReqVO reqVO = new FeedbackCommentAttachmentRefPageReqVO();
       reqVO.setFeedbackCommentId(null);
       reqVO.setAttachmentId(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       PageResult<FeedbackCommentAttachmentRefDO> pageResult = feedbackCommentAttachmentRefService.getFeedbackCommentAttachmentRefPage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbFeedbackCommentAttachmentRef, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetFeedbackCommentAttachmentRefList() {
       // mock 数据
       FeedbackCommentAttachmentRefDO dbFeedbackCommentAttachmentRef = randomPojo(FeedbackCommentAttachmentRefDO.class, o -> { // 等会查询到
           o.setFeedbackCommentId(null);
           o.setAttachmentId(null);
           o.setCreateTime(null);
       });
       feedbackCommentAttachmentRefMapper.insert(dbFeedbackCommentAttachmentRef);
       // 测试 feedbackCommentId 不匹配
       feedbackCommentAttachmentRefMapper.insert(cloneIgnoreId(dbFeedbackCommentAttachmentRef, o -> o.setFeedbackCommentId(null)));
       // 测试 attachmentId 不匹配
       feedbackCommentAttachmentRefMapper.insert(cloneIgnoreId(dbFeedbackCommentAttachmentRef, o -> o.setAttachmentId(null)));
       // 测试 createTime 不匹配
       feedbackCommentAttachmentRefMapper.insert(cloneIgnoreId(dbFeedbackCommentAttachmentRef, o -> o.setCreateTime(null)));
       // 准备参数
       FeedbackCommentAttachmentRefExportReqVO reqVO = new FeedbackCommentAttachmentRefExportReqVO();
       reqVO.setFeedbackCommentId(null);
       reqVO.setAttachmentId(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       List<FeedbackCommentAttachmentRefDO> list = feedbackCommentAttachmentRefService.getFeedbackCommentAttachmentRefList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbFeedbackCommentAttachmentRef, list.get(0));
    }

}
