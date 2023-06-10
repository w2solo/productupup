package cn.iocoder.yudao.module.puu.dal.mysql.feedbackcategory;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcategory.FeedbackCategoryDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackcategory.vo.*;

/**
 * 反馈分类 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackCategoryMapper extends BaseMapperX<FeedbackCategoryDO> {

    default PageResult<FeedbackCategoryDO> selectPage(FeedbackCategoryPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<FeedbackCategoryDO>()
                .eqIfPresent(FeedbackCategoryDO::getProductId, reqVO.getProductId())
                .likeIfPresent(FeedbackCategoryDO::getName, reqVO.getName())
                .betweenIfPresent(FeedbackCategoryDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackCategoryDO::getId));
    }

    default List<FeedbackCategoryDO> selectList(FeedbackCategoryExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<FeedbackCategoryDO>()
                .eqIfPresent(FeedbackCategoryDO::getProductId, reqVO.getProductId())
                .likeIfPresent(FeedbackCategoryDO::getName, reqVO.getName())
                .betweenIfPresent(FeedbackCategoryDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(FeedbackCategoryDO::getId));
    }

}
