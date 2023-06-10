package cn.iocoder.yudao.module.puu.dal.mysql.feedbackattachmentref;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackattachmentref.FeedbackAttachmentRefDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackattachmentref.vo.*;

/**
 * 反馈关联的文件，多堆多 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackAttachmentRefMapper extends BaseMapperX<FeedbackAttachmentRefDO> {

    default PageResult<FeedbackAttachmentRefDO> selectPage(FeedbackAttachmentRefPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<FeedbackAttachmentRefDO>()
                .eqIfPresent(FeedbackAttachmentRefDO::getFeedbackId, reqVO.getFeedbackId())
                .eqIfPresent(FeedbackAttachmentRefDO::getAttachmentId, reqVO.getAttachmentId())
                .betweenIfPresent(FeedbackAttachmentRefDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackAttachmentRefDO::getId));
    }

    default List<FeedbackAttachmentRefDO> selectList(FeedbackAttachmentRefExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<FeedbackAttachmentRefDO>()
                .eqIfPresent(FeedbackAttachmentRefDO::getFeedbackId, reqVO.getFeedbackId())
                .eqIfPresent(FeedbackAttachmentRefDO::getAttachmentId, reqVO.getAttachmentId())
                .betweenIfPresent(FeedbackAttachmentRefDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackAttachmentRefDO::getId));
    }

}
