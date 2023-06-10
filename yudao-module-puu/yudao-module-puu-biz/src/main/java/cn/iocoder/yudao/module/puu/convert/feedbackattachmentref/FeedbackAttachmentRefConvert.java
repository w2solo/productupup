package cn.iocoder.yudao.module.puu.convert.feedbackattachmentref;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackattachmentref.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackattachmentref.FeedbackAttachmentRefDO;

/**
 * 反馈关联的文件，多堆多 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackAttachmentRefConvert {

    FeedbackAttachmentRefConvert INSTANCE = Mappers.getMapper(FeedbackAttachmentRefConvert.class);

    FeedbackAttachmentRefDO convert(FeedbackAttachmentRefCreateReqVO bean);

    FeedbackAttachmentRefDO convert(FeedbackAttachmentRefUpdateReqVO bean);

    FeedbackAttachmentRefRespVO convert(FeedbackAttachmentRefDO bean);

    List<FeedbackAttachmentRefRespVO> convertList(List<FeedbackAttachmentRefDO> list);

    PageResult<FeedbackAttachmentRefRespVO> convertPage(PageResult<FeedbackAttachmentRefDO> page);

    List<FeedbackAttachmentRefExcelVO> convertList02(List<FeedbackAttachmentRefDO> list);

}
