package cn.iocoder.yudao.module.puu.dal.mysql.product;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.puu.dal.dataobject.product.ProductDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.puu.controller.admin.product.vo.*;

/**
 * 项目 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface ProductMapper extends BaseMapperX<ProductDO> {

    default PageResult<ProductDO> selectPage(ProductPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<ProductDO>()
                .likeIfPresent(ProductDO::getName, reqVO.getName())
                .betweenIfPresent(ProductDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(ProductDO::getId));
    }

    default List<ProductDO> selectList(ProductExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<ProductDO>()
                .likeIfPresent(ProductDO::getName, reqVO.getName())
                .betweenIfPresent(ProductDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(ProductDO::getId));
    }

}
