package cn.iocoder.yudao.module.puu.convert.feedbackcomment;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackcomment.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcomment.FeedbackCommentDO;

/**
 * 反馈评论 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackCommentConvert {

    FeedbackCommentConvert INSTANCE = Mappers.getMapper(FeedbackCommentConvert.class);

    FeedbackCommentDO convert(FeedbackCommentCreateReqVO bean);

    FeedbackCommentDO convert(FeedbackCommentUpdateReqVO bean);

    FeedbackCommentRespVO convert(FeedbackCommentDO bean);

    List<FeedbackCommentRespVO> convertList(List<FeedbackCommentDO> list);

    PageResult<FeedbackCommentRespVO> convertPage(PageResult<FeedbackCommentDO> page);

    List<FeedbackCommentExcelVO> convertList02(List<FeedbackCommentDO> list);

}
