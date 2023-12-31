package cn.iocoder.yudao.module.puu.convert.product;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.puu.controller.admin.product.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.product.ProductDO;

/**
 * 项目 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface ProductConvert {

    ProductConvert INSTANCE = Mappers.getMapper(ProductConvert.class);

    ProductDO convert(ProductCreateReqVO bean);

    ProductDO convert(ProductUpdateReqVO bean);

    ProductRespVO convert(ProductDO bean);

    List<ProductRespVO> convertList(List<ProductDO> list);

    PageResult<ProductRespVO> convertPage(PageResult<ProductDO> page);

    List<ProductExcelVO> convertList02(List<ProductDO> list);

}
