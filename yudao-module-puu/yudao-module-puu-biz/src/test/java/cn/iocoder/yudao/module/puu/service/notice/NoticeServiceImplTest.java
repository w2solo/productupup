package cn.iocoder.yudao.module.puu.service.notice;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import jakarta.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.puu.controller.admin.notice.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.notice.NoticeDO;
import cn.iocoder.yudao.module.puu.dal.mysql.notice.NoticeMapper;
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
* {@link NoticeServiceImpl} 的单元测试类
*
* @author 芋道源码
*/
@Import(NoticeServiceImpl.class)
public class NoticeServiceImplTest extends BaseDbUnitTest {

    @Resource
    private NoticeServiceImpl noticeService;

    @Resource
    private NoticeMapper noticeMapper;

    @Test
    public void testCreateNotice_success() {
        // 准备参数
        NoticeCreateReqVO reqVO = randomPojo(NoticeCreateReqVO.class);

        // 调用
        Long noticeId = noticeService.createNotice(reqVO);
        // 断言
        assertNotNull(noticeId);
        // 校验记录的属性是否正确
        NoticeDO notice = noticeMapper.selectById(noticeId);
        assertPojoEquals(reqVO, notice);
    }

    @Test
    public void testUpdateNotice_success() {
        // mock 数据
        NoticeDO dbNotice = randomPojo(NoticeDO.class);
        noticeMapper.insert(dbNotice);// @Sql: 先插入出一条存在的数据
        // 准备参数
        NoticeUpdateReqVO reqVO = randomPojo(NoticeUpdateReqVO.class, o -> {
            o.setId(dbNotice.getId()); // 设置更新的 ID
        });

        // 调用
        noticeService.updateNotice(reqVO);
        // 校验是否更新正确
        NoticeDO notice = noticeMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, notice);
    }

    @Test
    public void testUpdateNotice_notExists() {
        // 准备参数
        NoticeUpdateReqVO reqVO = randomPojo(NoticeUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> noticeService.updateNotice(reqVO), NOTICE_NOT_EXISTS);
    }

    @Test
    public void testDeleteNotice_success() {
        // mock 数据
        NoticeDO dbNotice = randomPojo(NoticeDO.class);
        noticeMapper.insert(dbNotice);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbNotice.getId();

        // 调用
        noticeService.deleteNotice(id);
       // 校验数据不存在了
       assertNull(noticeMapper.selectById(id));
    }

    @Test
    public void testDeleteNotice_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> noticeService.deleteNotice(id), NOTICE_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetNoticePage() {
       // mock 数据
       NoticeDO dbNotice = randomPojo(NoticeDO.class, o -> { // 等会查询到
           o.setTitle(null);
           o.setContent(null);
           o.setJumpUrl(null);
           o.setCreateTime(null);
           o.setProductId(null);
       });
       noticeMapper.insert(dbNotice);
       // 测试 title 不匹配
       noticeMapper.insert(cloneIgnoreId(dbNotice, o -> o.setTitle(null)));
       // 测试 content 不匹配
       noticeMapper.insert(cloneIgnoreId(dbNotice, o -> o.setContent(null)));
       // 测试 jumpUrl 不匹配
       noticeMapper.insert(cloneIgnoreId(dbNotice, o -> o.setJumpUrl(null)));
       // 测试 createTime 不匹配
       noticeMapper.insert(cloneIgnoreId(dbNotice, o -> o.setCreateTime(null)));
       // 测试 productId 不匹配
       noticeMapper.insert(cloneIgnoreId(dbNotice, o -> o.setProductId(null)));
       // 准备参数
       NoticePageReqVO reqVO = new NoticePageReqVO();
       reqVO.setTitle(null);
       reqVO.setContent(null);
       reqVO.setJumpUrl(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));
       reqVO.setProductId(null);

       // 调用
       PageResult<NoticeDO> pageResult = noticeService.getNoticePage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbNotice, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetNoticeList() {
       // mock 数据
       NoticeDO dbNotice = randomPojo(NoticeDO.class, o -> { // 等会查询到
           o.setTitle(null);
           o.setContent(null);
           o.setJumpUrl(null);
           o.setCreateTime(null);
           o.setProductId(null);
       });
       noticeMapper.insert(dbNotice);
       // 测试 title 不匹配
       noticeMapper.insert(cloneIgnoreId(dbNotice, o -> o.setTitle(null)));
       // 测试 content 不匹配
       noticeMapper.insert(cloneIgnoreId(dbNotice, o -> o.setContent(null)));
       // 测试 jumpUrl 不匹配
       noticeMapper.insert(cloneIgnoreId(dbNotice, o -> o.setJumpUrl(null)));
       // 测试 createTime 不匹配
       noticeMapper.insert(cloneIgnoreId(dbNotice, o -> o.setCreateTime(null)));
       // 测试 productId 不匹配
       noticeMapper.insert(cloneIgnoreId(dbNotice, o -> o.setProductId(null)));
       // 准备参数
       NoticeExportReqVO reqVO = new NoticeExportReqVO();
       reqVO.setTitle(null);
       reqVO.setContent(null);
       reqVO.setJumpUrl(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));
       reqVO.setProductId(null);

       // 调用
       List<NoticeDO> list = noticeService.getNoticeList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbNotice, list.get(0));
    }

}
