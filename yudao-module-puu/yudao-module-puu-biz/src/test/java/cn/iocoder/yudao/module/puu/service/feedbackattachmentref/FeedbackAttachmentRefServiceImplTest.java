package cn.iocoder.yudao.module.puu.service.feedbackattachmentref;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import jakarta.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.puu.controller.admin.feedbackattachmentref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackattachmentref.FeedbackAttachmentRefDO;
import cn.iocoder.yudao.module.puu.dal.mysql.feedbackattachmentref.FeedbackAttachmentRefMapper;
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
* {@link FeedbackAttachmentRefServiceImpl} 的单元测试类
*
* @author 芋道源码
*/
@Import(FeedbackAttachmentRefServiceImpl.class)
public class FeedbackAttachmentRefServiceImplTest extends BaseDbUnitTest {

    @Resource
    private FeedbackAttachmentRefServiceImpl feedbackAttachmentRefService;

    @Resource
    private FeedbackAttachmentRefMapper feedbackAttachmentRefMapper;

    @Test
    public void testCreateFeedbackAttachmentRef_success() {
        // 准备参数
        FeedbackAttachmentRefCreateReqVO reqVO = randomPojo(FeedbackAttachmentRefCreateReqVO.class);

        // 调用
        Long feedbackAttachmentRefId = feedbackAttachmentRefService.createFeedbackAttachmentRef(reqVO);
        // 断言
        assertNotNull(feedbackAttachmentRefId);
        // 校验记录的属性是否正确
        FeedbackAttachmentRefDO feedbackAttachmentRef = feedbackAttachmentRefMapper.selectById(feedbackAttachmentRefId);
        assertPojoEquals(reqVO, feedbackAttachmentRef);
    }

    @Test
    public void testUpdateFeedbackAttachmentRef_success() {
        // mock 数据
        FeedbackAttachmentRefDO dbFeedbackAttachmentRef = randomPojo(FeedbackAttachmentRefDO.class);
        feedbackAttachmentRefMapper.insert(dbFeedbackAttachmentRef);// @Sql: 先插入出一条存在的数据
        // 准备参数
        FeedbackAttachmentRefUpdateReqVO reqVO = randomPojo(FeedbackAttachmentRefUpdateReqVO.class, o -> {
            o.setId(dbFeedbackAttachmentRef.getId()); // 设置更新的 ID
        });

        // 调用
        feedbackAttachmentRefService.updateFeedbackAttachmentRef(reqVO);
        // 校验是否更新正确
        FeedbackAttachmentRefDO feedbackAttachmentRef = feedbackAttachmentRefMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, feedbackAttachmentRef);
    }

    @Test
    public void testUpdateFeedbackAttachmentRef_notExists() {
        // 准备参数
        FeedbackAttachmentRefUpdateReqVO reqVO = randomPojo(FeedbackAttachmentRefUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> feedbackAttachmentRefService.updateFeedbackAttachmentRef(reqVO), FEEDBACK_ATTACHMENT_REF_NOT_EXISTS);
    }

    @Test
    public void testDeleteFeedbackAttachmentRef_success() {
        // mock 数据
        FeedbackAttachmentRefDO dbFeedbackAttachmentRef = randomPojo(FeedbackAttachmentRefDO.class);
        feedbackAttachmentRefMapper.insert(dbFeedbackAttachmentRef);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbFeedbackAttachmentRef.getId();

        // 调用
        feedbackAttachmentRefService.deleteFeedbackAttachmentRef(id);
       // 校验数据不存在了
       assertNull(feedbackAttachmentRefMapper.selectById(id));
    }

    @Test
    public void testDeleteFeedbackAttachmentRef_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> feedbackAttachmentRefService.deleteFeedbackAttachmentRef(id), FEEDBACK_ATTACHMENT_REF_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetFeedbackAttachmentRefPage() {
       // mock 数据
       FeedbackAttachmentRefDO dbFeedbackAttachmentRef = randomPojo(FeedbackAttachmentRefDO.class, o -> { // 等会查询到
           o.setFeedbackId(null);
           o.setAttachmentId(null);
           o.setCreateTime(null);
       });
       feedbackAttachmentRefMapper.insert(dbFeedbackAttachmentRef);
       // 测试 feedbackId 不匹配
       feedbackAttachmentRefMapper.insert(cloneIgnoreId(dbFeedbackAttachmentRef, o -> o.setFeedbackId(null)));
       // 测试 attachmentId 不匹配
       feedbackAttachmentRefMapper.insert(cloneIgnoreId(dbFeedbackAttachmentRef, o -> o.setAttachmentId(null)));
       // 测试 createTime 不匹配
       feedbackAttachmentRefMapper.insert(cloneIgnoreId(dbFeedbackAttachmentRef, o -> o.setCreateTime(null)));
       // 准备参数
       FeedbackAttachmentRefPageReqVO reqVO = new FeedbackAttachmentRefPageReqVO();
       reqVO.setFeedbackId(null);
       reqVO.setAttachmentId(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       PageResult<FeedbackAttachmentRefDO> pageResult = feedbackAttachmentRefService.getFeedbackAttachmentRefPage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbFeedbackAttachmentRef, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetFeedbackAttachmentRefList() {
       // mock 数据
       FeedbackAttachmentRefDO dbFeedbackAttachmentRef = randomPojo(FeedbackAttachmentRefDO.class, o -> { // 等会查询到
           o.setFeedbackId(null);
           o.setAttachmentId(null);
           o.setCreateTime(null);
       });
       feedbackAttachmentRefMapper.insert(dbFeedbackAttachmentRef);
       // 测试 feedbackId 不匹配
       feedbackAttachmentRefMapper.insert(cloneIgnoreId(dbFeedbackAttachmentRef, o -> o.setFeedbackId(null)));
       // 测试 attachmentId 不匹配
       feedbackAttachmentRefMapper.insert(cloneIgnoreId(dbFeedbackAttachmentRef, o -> o.setAttachmentId(null)));
       // 测试 createTime 不匹配
       feedbackAttachmentRefMapper.insert(cloneIgnoreId(dbFeedbackAttachmentRef, o -> o.setCreateTime(null)));
       // 准备参数
       FeedbackAttachmentRefExportReqVO reqVO = new FeedbackAttachmentRefExportReqVO();
       reqVO.setFeedbackId(null);
       reqVO.setAttachmentId(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       List<FeedbackAttachmentRefDO> list = feedbackAttachmentRefService.getFeedbackAttachmentRefList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbFeedbackAttachmentRef, list.get(0));
    }

}
