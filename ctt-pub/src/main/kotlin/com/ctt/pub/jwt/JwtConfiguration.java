package com.ctt.pub.jwt;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConditionalOnProperty(prefix = "jwt", name = "secret")
@EnableConfigurationProperties(JwtProperties.class)
@RequiredArgsConstructor
public class JwtConfiguration {
    private final JwtProperties prop;

    @Bean
    public Jwt jwt() {
        return new Jwt(prop);
    }
}
