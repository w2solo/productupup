package cn.iocoder.yudao.module.puu.controller.admin.product;

import org.springframework.web.bind.annotation.*;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Operation;

import jakarta.validation.constraints.*;
import jakarta.validation.*;
import jakarta.servlet.http.*;
import java.util.*;
import java.io.IOException;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

import cn.iocoder.yudao.framework.excel.core.util.ExcelUtils;

import cn.iocoder.yudao.framework.operatelog.core.annotations.OperateLog;
import static cn.iocoder.yudao.framework.operatelog.core.enums.OperateTypeEnum.*;

import cn.iocoder.yudao.module.puu.controller.admin.product.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.product.ProductDO;
import cn.iocoder.yudao.module.puu.convert.product.ProductConvert;
import cn.iocoder.yudao.module.puu.service.product.ProductService;

@Tag(name = "管理后台 - 项目")
@RestController
@RequestMapping("/puu/product")
@Validated
public class ProductController {

    @Resource
    private ProductService productService;

    @PostMapping("/create")
    @Operation(summary = "创建项目")
    @PreAuthorize("@ss.hasPermission('puu:product:create')")
    public CommonResult<Long> createProduct(@Valid @RequestBody ProductCreateReqVO createReqVO) {
        return success(productService.createProduct(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新项目")
    @PreAuthorize("@ss.hasPermission('puu:product:update')")
    public CommonResult<Boolean> updateProduct(@Valid @RequestBody ProductUpdateReqVO updateReqVO) {
        productService.updateProduct(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除项目")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('puu:product:delete')")
    public CommonResult<Boolean> deleteProduct(@RequestParam("id") Long id) {
        productService.deleteProduct(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得项目")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('puu:product:query')")
    public CommonResult<ProductRespVO> getProduct(@RequestParam("id") Long id) {
        ProductDO product = productService.getProduct(id);
        return success(ProductConvert.INSTANCE.convert(product));
    }

    @GetMapping("/list")
    @Operation(summary = "获得项目列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('puu:product:query')")
    public CommonResult<List<ProductRespVO>> getProductList(@RequestParam("ids") Collection<Long> ids) {
        List<ProductDO> list = productService.getProductList(ids);
        return success(ProductConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得项目分页")
    @PreAuthorize("@ss.hasPermission('puu:product:query')")
    public CommonResult<PageResult<ProductRespVO>> getProductPage(@Valid ProductPageReqVO pageVO) {
        PageResult<ProductDO> pageResult = productService.getProductPage(pageVO);
        return success(ProductConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出项目 Excel")
    @PreAuthorize("@ss.hasPermission('puu:product:export')")
    @OperateLog(type = EXPORT)
    public void exportProductExcel(@Valid ProductExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<ProductDO> list = productService.getProductList(exportReqVO);
        // 导出 Excel
        List<ProductExcelVO> datas = ProductConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "项目.xls", "数据", ProductExcelVO.class, datas);
    }

}
