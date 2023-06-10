package cn.iocoder.yudao.module.puu.convert.feedbackvote;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackvote.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackvote.FeedbackVoteDO;

/**
 * 反馈投票 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackVoteConvert {

    FeedbackVoteConvert INSTANCE = Mappers.getMapper(FeedbackVoteConvert.class);

    FeedbackVoteDO convert(FeedbackVoteCreateReqVO bean);

    FeedbackVoteDO convert(FeedbackVoteUpdateReqVO bean);

    FeedbackVoteRespVO convert(FeedbackVoteDO bean);

    List<FeedbackVoteRespVO> convertList(List<FeedbackVoteDO> list);

    PageResult<FeedbackVoteRespVO> convertPage(PageResult<FeedbackVoteDO> page);

    List<FeedbackVoteExcelVO> convertList02(List<FeedbackVoteDO> list);

}
