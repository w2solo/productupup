package cn.iocoder.yudao.module.puu.service.versionhistory;

import org.springframework.stereotype.Service;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.puu.controller.admin.versionhistory.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.versionhistory.VersionHistoryDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.puu.convert.versionhistory.VersionHistoryConvert;
import cn.iocoder.yudao.module.puu.dal.mysql.versionhistory.VersionHistoryMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.puu.enums.ErrorCodeConstants.*;

/**
 * 版本历史 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class VersionHistoryServiceImpl implements VersionHistoryService {

    @Resource
    private VersionHistoryMapper versionHistoryMapper;

    @Override
    public Long createVersionHistory(VersionHistoryCreateReqVO createReqVO) {
        // 插入
        VersionHistoryDO versionHistory = VersionHistoryConvert.INSTANCE.convert(createReqVO);
        versionHistoryMapper.insert(versionHistory);
        // 返回
        return versionHistory.getId();
    }

    @Override
    public void updateVersionHistory(VersionHistoryUpdateReqVO updateReqVO) {
        // 校验存在
        this.validateVersionHistoryExists(updateReqVO.getId());
        // 更新
        VersionHistoryDO updateObj = VersionHistoryConvert.INSTANCE.convert(updateReqVO);
        versionHistoryMapper.updateById(updateObj);
    }

    @Override
    public void deleteVersionHistory(Long id) {
        // 校验存在
        this.validateVersionHistoryExists(id);
        // 删除
        versionHistoryMapper.deleteById(id);
    }

    private void validateVersionHistoryExists(Long id) {
        if (versionHistoryMapper.selectById(id) == null) {
            throw exception(VERSION_HISTORY_NOT_EXISTS);
        }
    }

    @Override
    public VersionHistoryDO getVersionHistory(Long id) {
        return versionHistoryMapper.selectById(id);
    }

    @Override
    public List<VersionHistoryDO> getVersionHistoryList(Collection<Long> ids) {
        return versionHistoryMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<VersionHistoryDO> getVersionHistoryPage(VersionHistoryPageReqVO pageReqVO) {
        return versionHistoryMapper.selectPage(pageReqVO);
    }

    @Override
    public List<VersionHistoryDO> getVersionHistoryList(VersionHistoryExportReqVO exportReqVO) {
        return versionHistoryMapper.selectList(exportReqVO);
    }

}
