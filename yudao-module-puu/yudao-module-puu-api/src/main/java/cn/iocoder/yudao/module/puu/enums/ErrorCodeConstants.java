package cn.iocoder.yudao.module.puu.enums;

// TODO 待办：请将下面的错误码复制到 yudao-module-puu-api 模块的 ErrorCodeConstants 类中。注意，请给“TODO 补充编号”设置一个错误码编号！！！
// ========== 反馈 TODO 补充编号 ==========


import cn.iocoder.yudao.framework.common.exception.ErrorCode;

public interface ErrorCodeConstants {
    ErrorCode FEEDBACK_NOT_EXISTS = new ErrorCode(4001, "反馈不存在");
    ErrorCode FEEDBACK_ATTACHMENT_REF_NOT_EXISTS = new ErrorCode(4002, "反馈关联的文件，多堆多不存在");
    ErrorCode FEEDBACK_CATEGORY_NOT_EXISTS = new ErrorCode(4003, "反馈分类不存在");
    ErrorCode FEEDBACK_COMMENT_NOT_EXISTS = new ErrorCode(4004, "反馈评论不存在");
    ErrorCode FEEDBACK_COMMENT_ATTACHMENT_REF_NOT_EXISTS = new ErrorCode(4005, "评论附件，多堆多不存在");
    ErrorCode FEEDBACK_TAG_NOT_EXISTS = new ErrorCode(4006, "反馈标签不存在");
    ErrorCode FEEDBACK_TAG_REF_NOT_EXISTS = new ErrorCode(4007, "反馈的标签，多堆多不存在");
    ErrorCode FEEDBACK_VOTE_NOT_EXISTS = new ErrorCode(4008, "反馈投票不存在");
    ErrorCode NOTICE_NOT_EXISTS = new ErrorCode(4009, "公告不存在");
    ErrorCode PRODUCT_NOT_EXISTS = new ErrorCode(4010, "项目不存在");
    ErrorCode VERSION_HISTORY_NOT_EXISTS = new ErrorCode(4011, "版本不存在");
}