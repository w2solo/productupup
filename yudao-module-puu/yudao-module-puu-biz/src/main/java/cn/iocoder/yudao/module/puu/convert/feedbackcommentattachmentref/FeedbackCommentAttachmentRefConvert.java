package cn.iocoder.yudao.module.puu.convert.feedbackcommentattachmentref;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackcommentattachmentref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcommentattachmentref.FeedbackCommentAttachmentRefDO;

/**
 * 评论附件，多堆多 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackCommentAttachmentRefConvert {

    FeedbackCommentAttachmentRefConvert INSTANCE = Mappers.getMapper(FeedbackCommentAttachmentRefConvert.class);

    FeedbackCommentAttachmentRefDO convert(FeedbackCommentAttachmentRefCreateReqVO bean);

    FeedbackCommentAttachmentRefDO convert(FeedbackCommentAttachmentRefUpdateReqVO bean);

    FeedbackCommentAttachmentRefRespVO convert(FeedbackCommentAttachmentRefDO bean);

    List<FeedbackCommentAttachmentRefRespVO> convertList(List<FeedbackCommentAttachmentRefDO> list);

    PageResult<FeedbackCommentAttachmentRefRespVO> convertPage(PageResult<FeedbackCommentAttachmentRefDO> page);

    List<FeedbackCommentAttachmentRefExcelVO> convertList02(List<FeedbackCommentAttachmentRefDO> list);

}
