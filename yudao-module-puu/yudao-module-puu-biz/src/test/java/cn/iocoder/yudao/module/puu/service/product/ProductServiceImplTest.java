package cn.iocoder.yudao.module.puu.service.product;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import jakarta.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.puu.controller.admin.product.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.product.ProductDO;
import cn.iocoder.yudao.module.puu.dal.mysql.product.ProductMapper;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import jakarta.annotation.Resource;
import org.springframework.context.annotation.Import;
import java.util.*;
import java.time.LocalDateTime;

import static cn.hutool.core.util.RandomUtil.*;
import static cn.iocoder.yudao.module.puu.enums.ErrorCodeConstants.*;
import static cn.iocoder.yudao.framework.test.core.util.AssertUtils.*;
import static cn.iocoder.yudao.framework.test.core.util.RandomUtils.*;
import static cn.iocoder.yudao.framework.common.util.object.ObjectUtils.*;
import static cn.iocoder.yudao.framework.common.util.date.DateUtils.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

/**
* {@link ProductServiceImpl} 的单元测试类
*
* @author 芋道源码
*/
@Import(ProductServiceImpl.class)
public class ProductServiceImplTest extends BaseDbUnitTest {

    @Resource
    private ProductServiceImpl productService;

    @Resource
    private ProductMapper productMapper;

    @Test
    public void testCreateProduct_success() {
        // 准备参数
        ProductCreateReqVO reqVO = randomPojo(ProductCreateReqVO.class);

        // 调用
        Long productId = productService.createProduct(reqVO);
        // 断言
        assertNotNull(productId);
        // 校验记录的属性是否正确
        ProductDO product = productMapper.selectById(productId);
        assertPojoEquals(reqVO, product);
    }

    @Test
    public void testUpdateProduct_success() {
        // mock 数据
        ProductDO dbProduct = randomPojo(ProductDO.class);
        productMapper.insert(dbProduct);// @Sql: 先插入出一条存在的数据
        // 准备参数
        ProductUpdateReqVO reqVO = randomPojo(ProductUpdateReqVO.class, o -> {
            o.setId(dbProduct.getId()); // 设置更新的 ID
        });

        // 调用
        productService.updateProduct(reqVO);
        // 校验是否更新正确
        ProductDO product = productMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, product);
    }

    @Test
    public void testUpdateProduct_notExists() {
        // 准备参数
        ProductUpdateReqVO reqVO = randomPojo(ProductUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> productService.updateProduct(reqVO), PRODUCT_NOT_EXISTS);
    }

    @Test
    public void testDeleteProduct_success() {
        // mock 数据
        ProductDO dbProduct = randomPojo(ProductDO.class);
        productMapper.insert(dbProduct);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbProduct.getId();

        // 调用
        productService.deleteProduct(id);
       // 校验数据不存在了
       assertNull(productMapper.selectById(id));
    }

    @Test
    public void testDeleteProduct_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> productService.deleteProduct(id), PRODUCT_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetProductPage() {
       // mock 数据
       ProductDO dbProduct = randomPojo(ProductDO.class, o -> { // 等会查询到
           o.setName(null);
           o.setCreateTime(null);
       });
       productMapper.insert(dbProduct);
       // 测试 name 不匹配
       productMapper.insert(cloneIgnoreId(dbProduct, o -> o.setName(null)));
       // 测试 createTime 不匹配
       productMapper.insert(cloneIgnoreId(dbProduct, o -> o.setCreateTime(null)));
       // 准备参数
       ProductPageReqVO reqVO = new ProductPageReqVO();
       reqVO.setName(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       PageResult<ProductDO> pageResult = productService.getProductPage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbProduct, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetProductList() {
       // mock 数据
       ProductDO dbProduct = randomPojo(ProductDO.class, o -> { // 等会查询到
           o.setName(null);
           o.setCreateTime(null);
       });
       productMapper.insert(dbProduct);
       // 测试 name 不匹配
       productMapper.insert(cloneIgnoreId(dbProduct, o -> o.setName(null)));
       // 测试 createTime 不匹配
       productMapper.insert(cloneIgnoreId(dbProduct, o -> o.setCreateTime(null)));
       // 准备参数
       ProductExportReqVO reqVO = new ProductExportReqVO();
       reqVO.setName(null);
       reqVO.setCreateTime((new LocalDateTime[]{}));

       // 调用
       List<ProductDO> list = productService.getProductList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbProduct, list.get(0));
    }

}
