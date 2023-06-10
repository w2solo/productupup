package cn.iocoder.yudao.module.puu.convert.feedbackcategory;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.puu.controller.admin.feedbackcategory.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.feedbackcategory.FeedbackCategoryDO;

/**
 * 反馈分类 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface FeedbackCategoryConvert {

    FeedbackCategoryConvert INSTANCE = Mappers.getMapper(FeedbackCategoryConvert.class);

    FeedbackCategoryDO convert(FeedbackCategoryCreateReqVO bean);

    FeedbackCategoryDO convert(FeedbackCategoryUpdateReqVO bean);

    FeedbackCategoryRespVO convert(FeedbackCategoryDO bean);

    List<FeedbackCategoryRespVO> convertList(List<FeedbackCategoryDO> list);

    PageResult<FeedbackCategoryRespVO> convertPage(PageResult<FeedbackCategoryDO> page);

    List<FeedbackCategoryExcelVO> convertList02(List<FeedbackCategoryDO> list);

}
