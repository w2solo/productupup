package cn.iocoder.yudao.module.puu.dal.mysql.feedbacktagref;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbacktagref.FeedbackTagRefDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.puu.controller.admin.feedbacktagref.vo.*;

/**
 * 反馈的标签，多堆多 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackTagRefMapper extends BaseMapperX<FeedbackTagRefDO> {

    default PageResult<FeedbackTagRefDO> selectPage(FeedbackTagRefPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<FeedbackTagRefDO>()
                .eqIfPresent(FeedbackTagRefDO::getFeedbackId, reqVO.getFeedbackId())
                .eqIfPresent(FeedbackTagRefDO::getFeedbackTagId, reqVO.getFeedbackTagId())
                .betweenIfPresent(FeedbackTagRefDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackTagRefDO::getId));
    }

    default List<FeedbackTagRefDO> selectList(FeedbackTagRefExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<FeedbackTagRefDO>()
                .eqIfPresent(FeedbackTagRefDO::getFeedbackId, reqVO.getFeedbackId())
                .eqIfPresent(FeedbackTagRefDO::getFeedbackTagId, reqVO.getFeedbackTagId())
                .betweenIfPresent(FeedbackTagRefDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackTagRefDO::getId));
    }

}
