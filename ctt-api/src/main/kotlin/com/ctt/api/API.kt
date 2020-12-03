package com.ctt.api

import com.ctt.api.config.AppSetting
import com.ctt.pub.config.JacksonConfiguration
import com.ctt.pub.config.ValidatorConfiguration
import com.ctt.pub.jwt.JwtConfiguration
import com.ctt.pub.wx.WxConfiguration
import com.ctt.pub.wx.WxPayConfiguration
import io.swagger.v3.oas.models.Components
import io.swagger.v3.oas.models.OpenAPI
import io.swagger.v3.oas.models.info.Info
import io.swagger.v3.oas.models.info.License
import io.swagger.v3.oas.models.security.SecurityScheme
import org.springdoc.core.GroupedOpenApi
import org.springframework.beans.factory.annotation.Value
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Import

@SpringBootApplication

@Import(JacksonConfiguration::class,
        ValidatorConfiguration::class,
        JwtConfiguration::class,
        WxConfiguration::class,
        WxPayConfiguration::class)
@EnableConfigurationProperties(AppSetting::class)
 class API

@Bean
fun customOpenAPI(@Value("\${springdoc.version}") appVersion: String?): OpenAPI? {
    return OpenAPI()
            .components(Components().addSecuritySchemes("basicScheme",
                    SecurityScheme().type(SecurityScheme.Type.HTTP).scheme("basic")))
            .info(Info().title("Tweet API").version(appVersion)
                    .license(License().name("Apache 2.0").url("http://springdoc.org")))
}

@Bean
fun storeOpenApi(): GroupedOpenApi? {
    val paths = arrayOf("/tweets/**")
    return GroupedOpenApi.builder().group("tweets").pathsToMatch(*paths)
            .build()
}

@Bean
fun userOpenApi(): GroupedOpenApi? {
    val paths = arrayOf("/stream/**")
    val packagedToMatch = arrayOf("org.springdoc.demo.app3")
    return GroupedOpenApi.builder().group("x-stream").pathsToMatch(*paths).packagesToScan(*packagedToMatch)
            .build()
}

fun main(args: Array<String>) {
    runApplication<API>(*args)
}
