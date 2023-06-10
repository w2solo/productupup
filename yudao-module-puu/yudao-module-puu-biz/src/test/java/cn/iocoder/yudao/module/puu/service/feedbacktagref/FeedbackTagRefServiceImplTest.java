package cn.iocoder.yudao.module.puu.service.feedbacktagref;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import jakarta.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.puu.controller.admin.feedbacktagref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbacktagref.FeedbackTagRefDO;
import cn.iocoder.yudao.module.puu.dal.mysql.feedbacktagref.FeedbackTagRefMapper;
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
* {@link FeedbackTagRefServiceImpl} 的单元测试类
*
* @author 芋道源码
*/
@Import(FeedbackTagRefServiceImpl.class)
public class FeedbackTagRefServiceImplTest extends BaseDbUnitTest {

    @Resource
    private FeedbackTagRefServiceImpl feedbackTagRefService;

    @Resource
    private FeedbackTagRefMapper feedbackTagRefMapper;

    @Test
    public void testCreateFeedbackTagRef_success() {
        // 准备参数
        FeedbackTagRefCreateReqVO reqVO = randomPojo(FeedbackTagRefCreateReqVO.class);

        // 调用
        Long feedbackTagRefId = feedbackTagRefService.createFeedbackTagRef(reqVO);
        // 断言
        assertNotNull(feedbackTagRefId);
        // 校验记录的属性是否正确
        FeedbackTagRefDO feedbackTagRef = feedbackTagRefMapper.selectById(feedbackTagRefId);
        assertPojoEquals(reqVO, feedbackTagRef);
    }

    @Test
    public void testUpdateFeedbackTagRef_success() {
        // mock 数据
        FeedbackTagRefDO dbFeedbackTagRef = randomPojo(FeedbackTagRefDO.class);
        feedbackTagRefMapper.insert(dbFeedbackTagRef);// @Sql: 先插入出一条存在的数据
        // 准备参数
        FeedbackTagRefUpdateReqVO reqVO = randomPojo(FeedbackTagRefUpdateReqVO.class, o -> {
            o.setId(dbFeedbackTagRef.getId()); // 设置更新的 ID
        });

        // 调用
        feedbackTagRefService.updateFeedbackTagRef(reqVO);
        // 校验是否更新正确
        FeedbackTagRefDO feedbackTagRef = feedbackTagRefMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, feedbackTagRef);
    }

    @Test
    public void testUpdateFeedbackTagRef_notExists() {
        // 准备参数
        FeedbackTagRefUpdateReqVO reqVO = randomPojo(FeedbackTagRefUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> feedbackTagRefService.updateFeedbackTagRef(reqVO), FEEDBACK_TAG_REF_NOT_EXISTS);
    }

    @Test
    public void testDeleteFeedbackTagRef_success() {
        // mock 数据
        FeedbackTagRefDO dbFeedbackTagRef = randomPojo(FeedbackTagRefDO.class);
        feedbackTagRefMapper.insert(dbFeedbackTagRef);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbFeedbackTagRef.getId();

        // 调用
        feedbackTagRefService.deleteFeedbackTagRef(id);
       // 校验数据不存在了
       assertNull(feedbackTagRefMapper.selectById(id));
    }

    @Test
    public void testDeleteFeedbackTagRef_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> feedbackTagRefService.deleteFeedbackTagRef(id), FEEDBACK_TAG_REF_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetFeedbackTagRefPage() {
       // mock 数据
       FeedbackTagRefDO dbFeedbackTagRef = randomPojo(FeedbackTagRefDO.class, o -> { // 等会查询到
           o.setFeedbackId(null);
           o.setFeedbackTagId(null);
           o.setCreateTime(null);
       });
       feedbackTagRefMapper.insert(dbFeedbackTagRef);
       // 测试 feedbackId 不匹配
       feedbackTagRefMapper.insert(cloneIgnoreId(dbFeedbackTagRef, o -> o.setFeedbackId(null)));
       // 测试 feedbackTagId 不匹配
       feedbackTagRefMapper.insert(cloneIgnoreId(dbFeedbackTagRef, o -> o.setFeedbackTagId(null)));
       // 测试 createTime 不匹配
       feedbackTagRefMapper.insert(cloneIgnoreId(dbFeedbackTagRef, o -> o.setCreateTime(null)));
       // 准备参数
       FeedbackTagRefPageReqVO reqVO = new FeedbackTagRefPageReqVO();
       reqVO.setFeedbackId(null);
       reqVO.setFeedbackTagId(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       PageResult<FeedbackTagRefDO> pageResult = feedbackTagRefService.getFeedbackTagRefPage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbFeedbackTagRef, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetFeedbackTagRefList() {
       // mock 数据
       FeedbackTagRefDO dbFeedbackTagRef = randomPojo(FeedbackTagRefDO.class, o -> { // 等会查询到
           o.setFeedbackId(null);
           o.setFeedbackTagId(null);
           o.setCreateTime(null);
       });
       feedbackTagRefMapper.insert(dbFeedbackTagRef);
       // 测试 feedbackId 不匹配
       feedbackTagRefMapper.insert(cloneIgnoreId(dbFeedbackTagRef, o -> o.setFeedbackId(null)));
       // 测试 feedbackTagId 不匹配
       feedbackTagRefMapper.insert(cloneIgnoreId(dbFeedbackTagRef, o -> o.setFeedbackTagId(null)));
       // 测试 createTime 不匹配
       feedbackTagRefMapper.insert(cloneIgnoreId(dbFeedbackTagRef, o -> o.setCreateTime(null)));
       // 准备参数
       FeedbackTagRefExportReqVO reqVO = new FeedbackTagRefExportReqVO();
       reqVO.setFeedbackId(null);
       reqVO.setFeedbackTagId(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       List<FeedbackTagRefDO> list = feedbackTagRefService.getFeedbackTagRefList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbFeedbackTagRef, list.get(0));
    }

}
