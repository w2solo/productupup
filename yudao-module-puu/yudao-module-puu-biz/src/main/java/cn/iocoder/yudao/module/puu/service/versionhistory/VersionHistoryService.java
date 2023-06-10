package cn.iocoder.yudao.module.puu.service.versionhistory;

import java.util.*;
import jakarta.validation.*;
import cn.iocoder.yudao.module.puu.controller.admin.versionhistory.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.versionhistory.VersionHistoryDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 版本历史 Service 接口
 *
 * @author 芋道源码
 */
public interface VersionHistoryService {

    /**
     * 创建版本历史
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createVersionHistory(@Valid VersionHistoryCreateReqVO createReqVO);

    /**
     * 更新版本历史
     *
     * @param updateReqVO 更新信息
     */
    void updateVersionHistory(@Valid VersionHistoryUpdateReqVO updateReqVO);

    /**
     * 删除版本历史
     *
     * @param id 编号
     */
    void deleteVersionHistory(Long id);

    /**
     * 获得版本历史
     *
     * @param id 编号
     * @return 版本历史
     */
    VersionHistoryDO getVersionHistory(Long id);

    /**
     * 获得版本历史列表
     *
     * @param ids 编号
     * @return 版本历史列表
     */
    List<VersionHistoryDO> getVersionHistoryList(Collection<Long> ids);

    /**
     * 获得版本历史分页
     *
     * @param pageReqVO 分页查询
     * @return 版本历史分页
     */
    PageResult<VersionHistoryDO> getVersionHistoryPage(VersionHistoryPageReqVO pageReqVO);

    /**
     * 获得版本历史列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 版本历史列表
     */
    List<VersionHistoryDO> getVersionHistoryList(VersionHistoryExportReqVO exportReqVO);

}
