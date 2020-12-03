package com.ctt.pub.exception;

import com.ctt.pub.constants.Constants;
import com.ctt.pub.result.Result;
import com.ctt.pub.wx.WxException;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.validator.internal.engine.path.PathImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import java.util.Set;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {
    @Autowired
    private ApplicationContext context;

    private boolean isDev = true;

    @PostConstruct
    public void init() {
        String[] activeProfiles = context.getEnvironment().getActiveProfiles();
        if (activeProfiles.length > 0) {
            if (Constants.PROFILE_PROD.equals(activeProfiles[0])) {
                isDev = false;
            }
        }
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result<?> validExceptionHandler(MethodArgumentNotValidException e) {
        FieldError error = e.getBindingResult().getFieldError();
        String message = error != null ? String.format("%s", error.getDefaultMessage()) : "参数错误";
        return result(Result.PARAM_ERROR.getCode(), message, e);
    }

    @ExceptionHandler(BindException.class)
    public Result<?> validExceptionHandler(BindException e) {
        FieldError error = e.getFieldError();
        String message = error != null ? String.format("%s", error.getDefaultMessage()) : "参数错误";
        return result(Result.PARAM_ERROR.getCode(), message, e);
    }

    @ExceptionHandler(ValidationException.class)
    public Result<?> validExceptionHandler(ValidationException e) {
        if (e instanceof ConstraintViolationException) {
            ConstraintViolationException exs = (ConstraintViolationException) e;
            Set<ConstraintViolation<?>> violations = exs.getConstraintViolations();
            for (ConstraintViolation<?> item : violations) {
                String message = ((PathImpl) item.getPropertyPath()).getLeafNode().getName() + item.getMessage();
                return result(Result.PARAM_ERROR.getCode(), message, e);
            }
        }
        return result(Result.PARAM_ERROR, e);
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public Result<?> argumentTypeMismatchHandler(MethodArgumentTypeMismatchException e) {
        return result(Result.PARAM_ERROR, e);
    }

    @ExceptionHandler(WxException.class)
    public Result<?> WxExceptionHandler(WxException e) {
        return result(Result.err(e.getError()), e);
    }

    @ExceptionHandler(BizException.class)
    public Result<?> bizExceptionHandler(BizException e) {
        return result(Result.err(e), e);
    }

    @ExceptionHandler(Exception.class)
    public Result<?> unknownExceptionHandler(Exception e) {
        return result(Result.err(500, "服务器出错"), e);
    }


    private void result(HttpServletResponse response, HttpStatus status) {
        response.setStatus(status.value());
    }

    private Result<?> result(Result<?> result, Exception e) {
        log.error("exception! ", e);
        if (isDev) {
            return Result.err(result.getCode(), result.getMsg() + " " + e.getMessage());
        } else {
            return result;
        }
    }

    private Result<?> result(int code, String msg, Exception e) {
        log.error("exception! ", e);
        if (isDev) {
            return Result.err(code, msg + " " + e.getMessage());
        } else {
            return Result.err(code, msg);
        }
    }
}
