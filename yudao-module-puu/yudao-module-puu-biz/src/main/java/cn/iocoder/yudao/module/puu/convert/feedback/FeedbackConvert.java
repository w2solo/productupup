package cn.iocoder.yudao.module.puu.convert.feedback;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.puu.controller.admin.feedback.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedback.FeedbackDO;

/**
 * 反馈 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackConvert {

    FeedbackConvert INSTANCE = Mappers.getMapper(FeedbackConvert.class);

    FeedbackDO convert(FeedbackCreateReqVO bean);

    FeedbackDO convert(FeedbackUpdateReqVO bean);

    FeedbackRespVO convert(FeedbackDO bean);

    List<FeedbackRespVO> convertList(List<FeedbackDO> list);

    PageResult<FeedbackRespVO> convertPage(PageResult<FeedbackDO> page);

    List<FeedbackExcelVO> convertList02(List<FeedbackDO> list);

}
