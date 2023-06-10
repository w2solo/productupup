package cn.iocoder.yudao.module.puu.convert.notice;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.puu.controller.admin.notice.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.notice.NoticeDO;

/**
 * 公告 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface NoticeConvert {

    NoticeConvert INSTANCE = Mappers.getMapper(NoticeConvert.class);

    NoticeDO convert(NoticeCreateReqVO bean);

    NoticeDO convert(NoticeUpdateReqVO bean);

    NoticeRespVO convert(NoticeDO bean);

    List<NoticeRespVO> convertList(List<NoticeDO> list);

    PageResult<NoticeRespVO> convertPage(PageResult<NoticeDO> page);

    List<NoticeExcelVO> convertList02(List<NoticeDO> list);

}
