package com.ctt.pub.wx;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration(proxyBeanMethods = false)
@ConditionalOnProperty(prefix = "wx", name = "appId")
@EnableConfigurationProperties(WxProperties.class)
@RequiredArgsConstructor
public class WxConfiguration {
    private final WxProperties prop;

    @Bean
    public WxService wechatService() {
        return new WxService(prop);
    }
}
