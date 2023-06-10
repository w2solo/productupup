package cn.iocoder.yudao.module.puu.service.versionhistory;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import jakarta.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.puu.controller.admin.versionhistory.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.versionhistory.VersionHistoryDO;
import cn.iocoder.yudao.module.puu.dal.mysql.versionhistory.VersionHistoryMapper;
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
* {@link VersionHistoryServiceImpl} 的单元测试类
*
* @author 芋道源码
*/
@Import(VersionHistoryServiceImpl.class)
public class VersionHistoryServiceImplTest extends BaseDbUnitTest {

    @Resource
    private VersionHistoryServiceImpl versionHistoryService;

    @Resource
    private VersionHistoryMapper versionHistoryMapper;

    @Test
    public void testCreateVersionHistory_success() {
        // 准备参数
        VersionHistoryCreateReqVO reqVO = randomPojo(VersionHistoryCreateReqVO.class);

        // 调用
        Long versionHistoryId = versionHistoryService.createVersionHistory(reqVO);
        // 断言
        assertNotNull(versionHistoryId);
        // 校验记录的属性是否正确
        VersionHistoryDO versionHistory = versionHistoryMapper.selectById(versionHistoryId);
        assertPojoEquals(reqVO, versionHistory);
    }

    @Test
    public void testUpdateVersionHistory_success() {
        // mock 数据
        VersionHistoryDO dbVersionHistory = randomPojo(VersionHistoryDO.class);
        versionHistoryMapper.insert(dbVersionHistory);// @Sql: 先插入出一条存在的数据
        // 准备参数
        VersionHistoryUpdateReqVO reqVO = randomPojo(VersionHistoryUpdateReqVO.class, o -> {
            o.setId(dbVersionHistory.getId()); // 设置更新的 ID
        });

        // 调用
        versionHistoryService.updateVersionHistory(reqVO);
        // 校验是否更新正确
        VersionHistoryDO versionHistory = versionHistoryMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, versionHistory);
    }

    @Test
    public void testUpdateVersionHistory_notExists() {
        // 准备参数
        VersionHistoryUpdateReqVO reqVO = randomPojo(VersionHistoryUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> versionHistoryService.updateVersionHistory(reqVO), VERSION_HISTORY_NOT_EXISTS);
    }

    @Test
    public void testDeleteVersionHistory_success() {
        // mock 数据
        VersionHistoryDO dbVersionHistory = randomPojo(VersionHistoryDO.class);
        versionHistoryMapper.insert(dbVersionHistory);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbVersionHistory.getId();

        // 调用
        versionHistoryService.deleteVersionHistory(id);
       // 校验数据不存在了
       assertNull(versionHistoryMapper.selectById(id));
    }

    @Test
    public void testDeleteVersionHistory_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> versionHistoryService.deleteVersionHistory(id), VERSION_HISTORY_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetVersionHistoryPage() {
       // mock 数据
       VersionHistoryDO dbVersionHistory = randomPojo(VersionHistoryDO.class, o -> { // 等会查询到
           o.setTitle(null);
           o.setVersionName(null);
           o.setVersionCode(null);
           o.setContent(null);
           o.setCreateTime(null);
           o.setProductId(null);
       });
       versionHistoryMapper.insert(dbVersionHistory);
       // 测试 title 不匹配
       versionHistoryMapper.insert(cloneIgnoreId(dbVersionHistory, o -> o.setTitle(null)));
       // 测试 versionName 不匹配
       versionHistoryMapper.insert(cloneIgnoreId(dbVersionHistory, o -> o.setVersionName(null)));
       // 测试 versionCode 不匹配
       versionHistoryMapper.insert(cloneIgnoreId(dbVersionHistory, o -> o.setVersionCode(null)));
       // 测试 content 不匹配
       versionHistoryMapper.insert(cloneIgnoreId(dbVersionHistory, o -> o.setContent(null)));
       // 测试 createTime 不匹配
       versionHistoryMapper.insert(cloneIgnoreId(dbVersionHistory, o -> o.setCreateTime(null)));
       // 测试 productId 不匹配
       versionHistoryMapper.insert(cloneIgnoreId(dbVersionHistory, o -> o.setProductId(null)));
       // 准备参数
       VersionHistoryPageReqVO reqVO = new VersionHistoryPageReqVO();
       reqVO.setTitle(null);
       reqVO.setVersionName(null);
       reqVO.setVersionCode(null);
       reqVO.setContent(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));
       reqVO.setProductId(null);

       // 调用
       PageResult<VersionHistoryDO> pageResult = versionHistoryService.getVersionHistoryPage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbVersionHistory, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetVersionHistoryList() {
       // mock 数据
       VersionHistoryDO dbVersionHistory = randomPojo(VersionHistoryDO.class, o -> { // 等会查询到
           o.setTitle(null);
           o.setVersionName(null);
           o.setVersionCode(null);
           o.setContent(null);
           o.setCreateTime(null);
           o.setProductId(null);
       });
       versionHistoryMapper.insert(dbVersionHistory);
       // 测试 title 不匹配
       versionHistoryMapper.insert(cloneIgnoreId(dbVersionHistory, o -> o.setTitle(null)));
       // 测试 versionName 不匹配
       versionHistoryMapper.insert(cloneIgnoreId(dbVersionHistory, o -> o.setVersionName(null)));
       // 测试 versionCode 不匹配
       versionHistoryMapper.insert(cloneIgnoreId(dbVersionHistory, o -> o.setVersionCode(null)));
       // 测试 content 不匹配
       versionHistoryMapper.insert(cloneIgnoreId(dbVersionHistory, o -> o.setContent(null)));
       // 测试 createTime 不匹配
       versionHistoryMapper.insert(cloneIgnoreId(dbVersionHistory, o -> o.setCreateTime(null)));
       // 测试 productId 不匹配
       versionHistoryMapper.insert(cloneIgnoreId(dbVersionHistory, o -> o.setProductId(null)));
       // 准备参数
       VersionHistoryExportReqVO reqVO = new VersionHistoryExportReqVO();
       reqVO.setTitle(null);
       reqVO.setVersionName(null);
       reqVO.setVersionCode(null);
       reqVO.setContent(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));
       reqVO.setProductId(null);

       // 调用
       List<VersionHistoryDO> list = versionHistoryService.getVersionHistoryList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbVersionHistory, list.get(0));
    }

}
