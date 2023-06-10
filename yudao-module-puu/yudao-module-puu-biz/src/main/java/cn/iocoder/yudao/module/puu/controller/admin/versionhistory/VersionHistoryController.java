package cn.iocoder.yudao.module.puu.controller.admin.versionhistory;

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

import cn.iocoder.yudao.module.puu.controller.admin.versionhistory.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.versionhistory.VersionHistoryDO;
import cn.iocoder.yudao.module.puu.convert.versionhistory.VersionHistoryConvert;
import cn.iocoder.yudao.module.puu.service.versionhistory.VersionHistoryService;

@Tag(name = "管理后台 - 版本历史")
@RestController
@RequestMapping("/puu/version-history")
@Validated
public class VersionHistoryController {

    @Resource
    private VersionHistoryService versionHistoryService;

    @PostMapping("/create")
    @Operation(summary = "创建版本历史")
    @PreAuthorize("@ss.hasPermission('puu:version-history:create')")
    public CommonResult<Long> createVersionHistory(@Valid @RequestBody VersionHistoryCreateReqVO createReqVO) {
        return success(versionHistoryService.createVersionHistory(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新版本历史")
    @PreAuthorize("@ss.hasPermission('puu:version-history:update')")
    public CommonResult<Boolean> updateVersionHistory(@Valid @RequestBody VersionHistoryUpdateReqVO updateReqVO) {
        versionHistoryService.updateVersionHistory(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除版本历史")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('puu:version-history:delete')")
    public CommonResult<Boolean> deleteVersionHistory(@RequestParam("id") Long id) {
        versionHistoryService.deleteVersionHistory(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得版本历史")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('puu:version-history:query')")
    public CommonResult<VersionHistoryRespVO> getVersionHistory(@RequestParam("id") Long id) {
        VersionHistoryDO versionHistory = versionHistoryService.getVersionHistory(id);
        return success(VersionHistoryConvert.INSTANCE.convert(versionHistory));
    }

    @GetMapping("/list")
    @Operation(summary = "获得版本历史列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('puu:version-history:query')")
    public CommonResult<List<VersionHistoryRespVO>> getVersionHistoryList(@RequestParam("ids") Collection<Long> ids) {
        List<VersionHistoryDO> list = versionHistoryService.getVersionHistoryList(ids);
        return success(VersionHistoryConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得版本历史分页")
    @PreAuthorize("@ss.hasPermission('puu:version-history:query')")
    public CommonResult<PageResult<VersionHistoryRespVO>> getVersionHistoryPage(@Valid VersionHistoryPageReqVO pageVO) {
        PageResult<VersionHistoryDO> pageResult = versionHistoryService.getVersionHistoryPage(pageVO);
        return success(VersionHistoryConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出版本历史 Excel")
    @PreAuthorize("@ss.hasPermission('puu:version-history:export')")
    @OperateLog(type = EXPORT)
    public void exportVersionHistoryExcel(@Valid VersionHistoryExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<VersionHistoryDO> list = versionHistoryService.getVersionHistoryList(exportReqVO);
        // 导出 Excel
        List<VersionHistoryExcelVO> datas = VersionHistoryConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "版本历史.xls", "数据", VersionHistoryExcelVO.class, datas);
    }

}
