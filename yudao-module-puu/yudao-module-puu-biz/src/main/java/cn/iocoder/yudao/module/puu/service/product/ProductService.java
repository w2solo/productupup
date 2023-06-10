package cn.iocoder.yudao.module.puu.service.product;

import java.util.*;
import jakarta.validation.*;
import cn.iocoder.yudao.module.puu.controller.admin.product.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.product.ProductDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 项目 Service 接口
 *
 * @author 芋道源码
 */
public interface ProductService {

    /**
     * 创建项目
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createProduct(@Valid ProductCreateReqVO createReqVO);

    /**
     * 更新项目
     *
     * @param updateReqVO 更新信息
     */
    void updateProduct(@Valid ProductUpdateReqVO updateReqVO);

    /**
     * 删除项目
     *
     * @param id 编号
     */
    void deleteProduct(Long id);

    /**
     * 获得项目
     *
     * @param id 编号
     * @return 项目
     */
    ProductDO getProduct(Long id);

    /**
     * 获得项目列表
     *
     * @param ids 编号
     * @return 项目列表
     */
    List<ProductDO> getProductList(Collection<Long> ids);

    /**
     * 获得项目分页
     *
     * @param pageReqVO 分页查询
     * @return 项目分页
     */
    PageResult<ProductDO> getProductPage(ProductPageReqVO pageReqVO);

    /**
     * 获得项目列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 项目列表
     */
    List<ProductDO> getProductList(ProductExportReqVO exportReqVO);

}
