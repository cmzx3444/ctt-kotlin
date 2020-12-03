package com.ctt.pub.exception;


import com.ctt.pub.result.Error;

public class BizException extends RuntimeException {
    public int code;

    public BizException(int code, String msg) {
        super(msg);
        this.code = code;
    }

    public BizException(Error err) {
        super(err.msg);
        this.code = err.code;
    }

    public BizException(Error err, String msg) {
        super(msg);
        this.code = err.code;
    }
}
