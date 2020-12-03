package com.ctt.pub.wx;

import com.ctt.pub.exception.BizException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.web.client.RestTemplate;

@RequiredArgsConstructor
public class WxService {
    private static final String jscode2sessionUrl
            = "https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code";

    private final WxProperties prop;
    private final RestTemplate restTemplate = new RestTemplate();
    private final ObjectMapper objectMapper = new ObjectMapper();

    public WxLoginResp jscode2session(String code) {
        String url = String.format(jscode2sessionUrl, prop.getAppId(), prop.getSecret(), code);
        String body = restTemplate.getForObject(url, String.class);
        try {
            return objectMapper.readValue(body, WxLoginResp.class);
        } catch (JsonProcessingException e) {
            throw new BizException(500, e.getMessage());
        }
    }
}
