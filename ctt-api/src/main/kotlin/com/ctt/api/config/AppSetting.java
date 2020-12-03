package com.ctt.api.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.time.Duration;

@Data
@ConfigurationProperties(prefix = "app")
public class AppSetting {
    Cors cors;
    Login login;

    @Data
    public static class Cors {
        String allowOrigins;
        Duration maxAge = Duration.ofDays(1);
    }

    @Data
    public static class Login {
        String[] path;
        String[] excludePath;
    }
}