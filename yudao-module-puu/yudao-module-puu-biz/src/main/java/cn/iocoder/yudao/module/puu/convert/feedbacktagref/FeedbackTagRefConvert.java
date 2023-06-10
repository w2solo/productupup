package cn.iocoder.yudao.module.puu.convert.feedbacktagref;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.puu.controller.admin.feedbacktagref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbacktagref.FeedbackTagRefDO;

/**
 * 反馈的标签，多堆多 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackTagRefConvert {

    FeedbackTagRefConvert INSTANCE = Mappers.getMapper(FeedbackTagRefConvert.class);

    FeedbackTagRefDO convert(FeedbackTagRefCreateReqVO bean);

    FeedbackTagRefDO convert(FeedbackTagRefUpdateReqVO bean);

    FeedbackTagRefRespVO convert(FeedbackTagRefDO bean);

    List<FeedbackTagRefRespVO> convertList(List<FeedbackTagRefDO> list);

    PageResult<FeedbackTagRefRespVO> convertPage(PageResult<FeedbackTagRefDO> page);

    List<FeedbackTagRefExcelVO> convertList02(List<FeedbackTagRefDO> list);

}
