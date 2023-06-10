package cn.iocoder.yudao.module.puu.convert.versionhistory;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.puu.controller.admin.versionhistory.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.versionhistory.VersionHistoryDO;

/**
 * 版本历史 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface VersionHistoryConvert {

    VersionHistoryConvert INSTANCE = Mappers.getMapper(VersionHistoryConvert.class);

    VersionHistoryDO convert(VersionHistoryCreateReqVO bean);

    VersionHistoryDO convert(VersionHistoryUpdateReqVO bean);

    VersionHistoryRespVO convert(VersionHistoryDO bean);

    List<VersionHistoryRespVO> convertList(List<VersionHistoryDO> list);

    PageResult<VersionHistoryRespVO> convertPage(PageResult<VersionHistoryDO> page);

    List<VersionHistoryExcelVO> convertList02(List<VersionHistoryDO> list);

}
