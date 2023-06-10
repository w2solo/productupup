package cn.iocoder.yudao.module.puu.controller.admin.notice;

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

import cn.iocoder.yudao.module.puu.controller.admin.notice.vo.*;
import cn.iocoder.yudao.module.puu.dal.dataobject.notice.NoticeDO;
import cn.iocoder.yudao.module.puu.convert.notice.NoticeConvert;
import cn.iocoder.yudao.module.puu.service.notice.NoticeService;

@Tag(name = "管理后台 - 公告")
@RestController
@RequestMapping("/puu/notice")
@Validated
public class NoticeController {

    @Resource
    private NoticeService noticeService;

    @PostMapping("/create")
    @Operation(summary = "创建公告")
    @PreAuthorize("@ss.hasPermission('puu:notice:create')")
    public CommonResult<Long> createNotice(@Valid @RequestBody NoticeCreateReqVO createReqVO) {
        return success(noticeService.createNotice(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新公告")
    @PreAuthorize("@ss.hasPermission('puu:notice:update')")
    public CommonResult<Boolean> updateNotice(@Valid @RequestBody NoticeUpdateReqVO updateReqVO) {
        noticeService.updateNotice(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除公告")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('puu:notice:delete')")
    public CommonResult<Boolean> deleteNotice(@RequestParam("id") Long id) {
        noticeService.deleteNotice(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得公告")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('puu:notice:query')")
    public CommonResult<NoticeRespVO> getNotice(@RequestParam("id") Long id) {
        NoticeDO notice = noticeService.getNotice(id);
        return success(NoticeConvert.INSTANCE.convert(notice));
    }

    @GetMapping("/list")
    @Operation(summary = "获得公告列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('puu:notice:query')")
    public CommonResult<List<NoticeRespVO>> getNoticeList(@RequestParam("ids") Collection<Long> ids) {
        List<NoticeDO> list = noticeService.getNoticeList(ids);
        return success(NoticeConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得公告分页")
    @PreAuthorize("@ss.hasPermission('puu:notice:query')")
    public CommonResult<PageResult<NoticeRespVO>> getNoticePage(@Valid NoticePageReqVO pageVO) {
        PageResult<NoticeDO> pageResult = noticeService.getNoticePage(pageVO);
        return success(NoticeConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出公告 Excel")
    @PreAuthorize("@ss.hasPermission('puu:notice:export')")
    @OperateLog(type = EXPORT)
    public void exportNoticeExcel(@Valid NoticeExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<NoticeDO> list = noticeService.getNoticeList(exportReqVO);
        // 导出 Excel
        List<NoticeExcelVO> datas = NoticeConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "公告.xls", "数据", NoticeExcelVO.class, datas);
    }

}
