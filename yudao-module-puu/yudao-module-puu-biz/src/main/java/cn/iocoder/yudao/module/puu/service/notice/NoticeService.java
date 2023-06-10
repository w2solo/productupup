package cn.iocoder.yudao.module.puu.service.notice;

import java.util.*;
import jakarta.validation.*;
import cn.iocoder.yudao.module.puu.controller.admin.notice.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.notice.NoticeDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 公告 Service 接口
 *
 * @author 芋道源码
 */
public interface NoticeService {

    /**
     * 创建公告
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createNotice(@Valid NoticeCreateReqVO createReqVO);

    /**
     * 更新公告
     *
     * @param updateReqVO 更新信息
     */
    void updateNotice(@Valid NoticeUpdateReqVO updateReqVO);

    /**
     * 删除公告
     *
     * @param id 编号
     */
    void deleteNotice(Long id);

    /**
     * 获得公告
     *
     * @param id 编号
     * @return 公告
     */
    NoticeDO getNotice(Long id);

    /**
     * 获得公告列表
     *
     * @param ids 编号
     * @return 公告列表
     */
    List<NoticeDO> getNoticeList(Collection<Long> ids);

    /**
     * 获得公告分页
     *
     * @param pageReqVO 分页查询
     * @return 公告分页
     */
    PageResult<NoticeDO> getNoticePage(NoticePageReqVO pageReqVO);

    /**
     * 获得公告列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 公告列表
     */
    List<NoticeDO> getNoticeList(NoticeExportReqVO exportReqVO);

}
