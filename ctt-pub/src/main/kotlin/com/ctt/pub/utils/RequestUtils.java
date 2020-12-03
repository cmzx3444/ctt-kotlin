package com.ctt.pub.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Slf4j
public class RequestUtils {

    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attributes = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes());
        if (attributes == null) return null;
        return attributes.getRequest();
    }

    public static <T> T getRequestAttr(String key) {
        ServletRequestAttributes attributes = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes());
        if (attributes == null) return null;
        return (T) attributes.getRequest().getAttribute(key);
    }

    public static HttpSession getSession() {
        HttpServletRequest req = getRequest();
        return req.getSession();
    }

    public static String getHead(String name) {
        HttpServletRequest req = getRequest();
        return req.getHeader(name);
    }

    public static String getBasePath() {
        HttpServletRequest request = getRequest();
        assert request != null;
        String path = request.getContextPath();
        int port = request.getRemotePort();
        String portStr = "";
        if (port != 80 && port != 443) {
            portStr = ":" + port;
        }
        return request.getScheme() +
                "://" +
                request.getServerName() +
                portStr +
                path +
                "/";
    }

    public static Map<String, String> getQueryParams() {
        HttpServletRequest request = getRequest();
        assert request != null;

        String queryString = request.getQueryString();
        if (!StringUtils.hasText(queryString)) {
            return new HashMap<>();
        }
        if (queryString.startsWith("?")) {
            queryString = queryString.substring(1);
        }
        String[] params = queryString.split("&");
        Map<String, String> map = new HashMap<>();
        for (String p : params) {
            String[] kv = p.split("=");
            if (kv.length != 2) {
                continue;
            }
            map.put(kv[0], kv[1]);
        }
        return map;
    }

    public static String getQueryString(Map<String, String> params) {
        if (params.isEmpty()) return "";
        StringBuilder sb = new StringBuilder();
        boolean first = true;
        for (Map.Entry<String, String> e : params.entrySet()) {
            sb.append(first ? "?" : "&");
            sb.append(e.getKey());
            sb.append("=");
            sb.append(e.getValue());
            first = false;
        }
        return sb.toString();
    }

    public static String getRequestURL() {
        HttpServletRequest request = getRequest();
        assert request != null;
        return request.getRequestURL().toString();
    }

    public static String getRequestURI() {
        HttpServletRequest request = getRequest();
        assert request != null;
        return request.getRequestURI();
    }
}
