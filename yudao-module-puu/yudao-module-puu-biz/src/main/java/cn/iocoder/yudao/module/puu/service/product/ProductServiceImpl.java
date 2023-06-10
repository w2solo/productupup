package cn.iocoder.yudao.module.puu.service.product;

import org.springframework.stereotype.Service;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.puu.controller.admin.product.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.product.ProductDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.puu.convert.product.ProductConvert;
import cn.iocoder.yudao.module.puu.dal.mysql.product.ProductMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.puu.enums.ErrorCodeConstants.*;

/**
 * 项目 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductMapper productMapper;

    @Override
    public Long createProduct(ProductCreateReqVO createReqVO) {
        // 插入
        ProductDO product = ProductConvert.INSTANCE.convert(createReqVO);
        productMapper.insert(product);
        // 返回
        return product.getId();
    }

    @Override
    public void updateProduct(ProductUpdateReqVO updateReqVO) {
        // 校验存在
        this.validateProductExists(updateReqVO.getId());
        // 更新
        ProductDO updateObj = ProductConvert.INSTANCE.convert(updateReqVO);
        productMapper.updateById(updateObj);
    }

    @Override
    public void deleteProduct(Long id) {
        // 校验存在
        this.validateProductExists(id);
        // 删除
        productMapper.deleteById(id);
    }

    private void validateProductExists(Long id) {
        if (productMapper.selectById(id) == null) {
            throw exception(PRODUCT_NOT_EXISTS);
        }
    }

    @Override
    public ProductDO getProduct(Long id) {
        return productMapper.selectById(id);
    }

    @Override
    public List<ProductDO> getProductList(Collection<Long> ids) {
        return productMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<ProductDO> getProductPage(ProductPageReqVO pageReqVO) {
        return productMapper.selectPage(pageReqVO);
    }

    @Override
    public List<ProductDO> getProductList(ProductExportReqVO exportReqVO) {
        return productMapper.selectList(exportReqVO);
    }

}
