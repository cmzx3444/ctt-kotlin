package com.ctt.pub.result;

import com.ctt.pub.exception.BizException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Data;

@Data
public class Result<T> {
    public static final Result<Void> SUCCESS = new Result<>();
    public static final Result<Void> PARAM_ERROR = new Result<>(InternalErrorCode.PARAMS_ILLEGAL);

    private static ObjectMapper MAPPER = new ObjectMapper();

    int code;
    String msg;
    T results;

    Result() {
    }

    Result(T data) {
        this.results = data;
        this.code = InternalErrorCode.SUCCESS.code;
        this.msg = InternalErrorCode.SUCCESS.msg;
    }

    Result(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    Result(Error err) {
        this.code = err.code;
        this.msg = err.msg;
    }

    public static Result<?> err(int code, String msg) {
        return new Result<>(code, msg);
    }

    public static Result<?> err(Error err) {
        return new Result<>(err.code, err.msg);
    }

    public static Result<?> err(BizException e) {
        return new Result<>(e.code, e.getMessage());
    }

    public static <D> Result<D> of(D data) {
        return new Result<D>(data);
    }

    public String json() {
        try {
            return MAPPER.writeValueAsString(this);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("json write error", e);
        }
    }
}
