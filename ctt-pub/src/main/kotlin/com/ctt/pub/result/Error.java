package com.ctt.pub.result;

import lombok.Data;

@Data
public class Error {
    public int code;
    public String msg;

    public Error(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
