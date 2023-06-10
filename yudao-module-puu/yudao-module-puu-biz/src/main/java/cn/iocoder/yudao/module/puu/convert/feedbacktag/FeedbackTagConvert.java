package cn.iocoder.yudao.module.puu.convert.feedbacktag;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.puu.controller.admin.feedbacktag.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbacktag.FeedbackTagDO;

/**
 * 反馈标签 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackTagConvert {

    FeedbackTagConvert INSTANCE = Mappers.getMapper(FeedbackTagConvert.class);

    FeedbackTagDO convert(FeedbackTagCreateReqVO bean);

    FeedbackTagDO convert(FeedbackTagUpdateReqVO bean);

    FeedbackTagRespVO convert(FeedbackTagDO bean);

    List<FeedbackTagRespVO> convertList(List<FeedbackTagDO> list);

    PageResult<FeedbackTagRespVO> convertPage(PageResult<FeedbackTagDO> page);

    List<FeedbackTagExcelVO> convertList02(List<FeedbackTagDO> list);

}
