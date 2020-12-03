package com.ctt.pub.result;

/**
 * 公用的错误
 */
public interface InternalErrorCode {
    Error SUCCESS = new Error(0, "");
    Error WX_LOGIN = new Error(1, "微信登陆失败");
    Error PARAMS_ILLEGAL = new Error(2, "参数输入不合法");
}
