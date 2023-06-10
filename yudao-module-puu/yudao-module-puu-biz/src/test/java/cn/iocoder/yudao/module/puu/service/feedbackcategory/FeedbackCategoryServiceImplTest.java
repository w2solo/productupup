package cn.iocoder.yudao.module.puu.service.feedbackcategory;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import jakarta.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.puu.controller.admin.feedbackcategory.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcategory.FeedbackCategoryDO;
import cn.iocoder.yudao.module.puu.dal.mysql.feedbackcategory.FeedbackCategoryMapper;
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
* {@link FeedbackCategoryServiceImpl} 的单元测试类
*
* @author 芋道源码
*/
@Import(FeedbackCategoryServiceImpl.class)
public class FeedbackCategoryServiceImplTest extends BaseDbUnitTest {

    @Resource
    private FeedbackCategoryServiceImpl feedbackCategoryService;

    @Resource
    private FeedbackCategoryMapper feedbackCategoryMapper;

    @Test
    public void testCreateFeedbackCategory_success() {
        // 准备参数
        FeedbackCategoryCreateReqVO reqVO = randomPojo(FeedbackCategoryCreateReqVO.class);

        // 调用
        Long feedbackCategoryId = feedbackCategoryService.createFeedbackCategory(reqVO);
        // 断言
        assertNotNull(feedbackCategoryId);
        // 校验记录的属性是否正确
        FeedbackCategoryDO feedbackCategory = feedbackCategoryMapper.selectById(feedbackCategoryId);
        assertPojoEquals(reqVO, feedbackCategory);
    }

    @Test
    public void testUpdateFeedbackCategory_success() {
        // mock 数据
        FeedbackCategoryDO dbFeedbackCategory = randomPojo(FeedbackCategoryDO.class);
        feedbackCategoryMapper.insert(dbFeedbackCategory);// @Sql: 先插入出一条存在的数据
        // 准备参数
        FeedbackCategoryUpdateReqVO reqVO = randomPojo(FeedbackCategoryUpdateReqVO.class, o -> {
            o.setId(dbFeedbackCategory.getId()); // 设置更新的 ID
        });

        // 调用
        feedbackCategoryService.updateFeedbackCategory(reqVO);
        // 校验是否更新正确
        FeedbackCategoryDO feedbackCategory = feedbackCategoryMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, feedbackCategory);
    }

    @Test
    public void testUpdateFeedbackCategory_notExists() {
        // 准备参数
        FeedbackCategoryUpdateReqVO reqVO = randomPojo(FeedbackCategoryUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> feedbackCategoryService.updateFeedbackCategory(reqVO), FEEDBACK_CATEGORY_NOT_EXISTS);
    }

    @Test
    public void testDeleteFeedbackCategory_success() {
        // mock 数据
        FeedbackCategoryDO dbFeedbackCategory = randomPojo(FeedbackCategoryDO.class);
        feedbackCategoryMapper.insert(dbFeedbackCategory);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbFeedbackCategory.getId();

        // 调用
        feedbackCategoryService.deleteFeedbackCategory(id);
       // 校验数据不存在了
       assertNull(feedbackCategoryMapper.selectById(id));
    }

    @Test
    public void testDeleteFeedbackCategory_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> feedbackCategoryService.deleteFeedbackCategory(id), FEEDBACK_CATEGORY_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetFeedbackCategoryPage() {
       // mock 数据
       FeedbackCategoryDO dbFeedbackCategory = randomPojo(FeedbackCategoryDO.class, o -> { // 等会查询到
           o.setProductId(null);
           o.setName(null);
           o.setCreateTime(null);
       });
       feedbackCategoryMapper.insert(dbFeedbackCategory);
       // 测试 productId 不匹配
       feedbackCategoryMapper.insert(cloneIgnoreId(dbFeedbackCategory, o -> o.setProductId(null)));
       // 测试 name 不匹配
       feedbackCategoryMapper.insert(cloneIgnoreId(dbFeedbackCategory, o -> o.setName(null)));
       // 测试 createTime 不匹配
       feedbackCategoryMapper.insert(cloneIgnoreId(dbFeedbackCategory, o -> o.setCreateTime(null)));
       // 准备参数
       FeedbackCategoryPageReqVO reqVO = new FeedbackCategoryPageReqVO();
       reqVO.setProductId(null);
       reqVO.setName(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       PageResult<FeedbackCategoryDO> pageResult = feedbackCategoryService.getFeedbackCategoryPage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbFeedbackCategory, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetFeedbackCategoryList() {
       // mock 数据
       FeedbackCategoryDO dbFeedbackCategory = randomPojo(FeedbackCategoryDO.class, o -> { // 等会查询到
           o.setProductId(null);
           o.setName(null);
           o.setCreateTime(null);
       });
       feedbackCategoryMapper.insert(dbFeedbackCategory);
       // 测试 productId 不匹配
       feedbackCategoryMapper.insert(cloneIgnoreId(dbFeedbackCategory, o -> o.setProductId(null)));
       // 测试 name 不匹配
       feedbackCategoryMapper.insert(cloneIgnoreId(dbFeedbackCategory, o -> o.setName(null)));
       // 测试 createTime 不匹配
       feedbackCategoryMapper.insert(cloneIgnoreId(dbFeedbackCategory, o -> o.setCreateTime(null)));
       // 准备参数
       FeedbackCategoryExportReqVO reqVO = new FeedbackCategoryExportReqVO();
       reqVO.setProductId(null);
       reqVO.setName(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       List<FeedbackCategoryDO> list = feedbackCategoryService.getFeedbackCategoryList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbFeedbackCategory, list.get(0));
    }

}
