package cn.iocoder.yudao.module.puu.service.notice;

import org.springframework.stereotype.Service;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.puu.controller.admin.notice.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.notice.NoticeDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.puu.convert.notice.NoticeConvert;
import cn.iocoder.yudao.module.puu.dal.mysql.notice.NoticeMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.puu.enums.ErrorCodeConstants.*;

/**
 * 公告 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class NoticeServiceImpl implements NoticeService {

    @Resource
    private NoticeMapper noticeMapper;

    @Override
    public Long createNotice(NoticeCreateReqVO createReqVO) {
        // 插入
        NoticeDO notice = NoticeConvert.INSTANCE.convert(createReqVO);
        noticeMapper.insert(notice);
        // 返回
        return notice.getId();
    }

    @Override
    public void updateNotice(NoticeUpdateReqVO updateReqVO) {
        // 校验存在
        this.validateNoticeExists(updateReqVO.getId());
        // 更新
        NoticeDO updateObj = NoticeConvert.INSTANCE.convert(updateReqVO);
        noticeMapper.updateById(updateObj);
    }

    @Override
    public void deleteNotice(Long id) {
        // 校验存在
        this.validateNoticeExists(id);
        // 删除
        noticeMapper.deleteById(id);
    }

    private void validateNoticeExists(Long id) {
        if (noticeMapper.selectById(id) == null) {
            throw exception(NOTICE_NOT_EXISTS);
        }
    }

    @Override
    public NoticeDO getNotice(Long id) {
        return noticeMapper.selectById(id);
    }

    @Override
    public List<NoticeDO> getNoticeList(Collection<Long> ids) {
        return noticeMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<NoticeDO> getNoticePage(NoticePageReqVO pageReqVO) {
        return noticeMapper.selectPage(pageReqVO);
    }

    @Override
    public List<NoticeDO> getNoticeList(NoticeExportReqVO exportReqVO) {
        return noticeMapper.selectList(exportReqVO);
    }

}
