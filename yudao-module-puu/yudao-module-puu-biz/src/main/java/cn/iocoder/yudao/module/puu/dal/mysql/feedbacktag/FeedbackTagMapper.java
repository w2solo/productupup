package cn.iocoder.yudao.module.puu.dal.mysql.feedbacktag;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbacktag.FeedbackTagDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.puu.controller.admin.feedbacktag.vo.*;

/**
 * 反馈标签 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackTagMapper extends BaseMapperX<FeedbackTagDO> {

    default PageResult<FeedbackTagDO> selectPage(FeedbackTagPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<FeedbackTagDO>()
                .likeIfPresent(FeedbackTagDO::getTagName, reqVO.getTagName())
                .betweenIfPresent(FeedbackTagDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackTagDO::getId));
    }

    default List<FeedbackTagDO> selectList(FeedbackTagExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<FeedbackTagDO>()
                .likeIfPresent(FeedbackTagDO::getTagName, reqVO.getTagName())
                .betweenIfPresent(FeedbackTagDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackTagDO::getId));
    }

}
