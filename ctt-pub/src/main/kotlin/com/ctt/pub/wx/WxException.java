package com.ctt.pub.wx;

import com.ctt.pub.result.Error;
import lombok.Getter;

public class WxException extends Exception {
    @Getter
    private Error error;

    public WxException(String msg) {
        super(msg);
    }

    public WxException(Exception e) {
        super(e);
    }

    public WxException(Error error) {
        super(error.getMsg());
        this.error = error;
    }


}
