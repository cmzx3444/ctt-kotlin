package com.ctt.admin.config

import com.ctt.pub.constants.Constants
import com.ctt.pub.jwt.Jwt
import io.swagger.v3.oas.annotations.info.Info
import io.swagger.v3.oas.annotations.info.License
import io.swagger.v3.oas.models.Components
import io.swagger.v3.oas.models.OpenAPI
import org.springframework.beans.factory.annotation.Value
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.http.HttpStatus
import org.springframework.util.StringUtils
import org.springframework.web.server.ServerWebExchange
import org.springframework.web.server.WebFilter
import org.springframework.web.server.WebFilterChain
import org.springframework.web.util.pattern.PathPattern
import org.springframework.web.util.pattern.PathPatternParser


@Configuration(proxyBeanMethods = false)
open class WebfluxConfig(
        val jwt: Jwt,
        val appSetting: AppSetting,
) {
    private val pathPattern: PathPattern = PathPatternParser().parse("")



    @Bean
    fun loginWebFilter(): WebFilter {

        return WebFilter { e: ServerWebExchange, c: WebFilterChain ->
            var pass = false;
            for (path in appSetting.login.excludePath) {
                val p = PathPatternParser().parse(path)
                if (p.matches(e.request.path)) {
                    pass = true;
                    break
                }
            }
            if (pass) {
                c.filter(e)
            } else {
                val token = e.request.headers[Constants.HEADER_AUTH_TOKEN]?.get(0)
                if (!StringUtils.hasText(token)) {
                    e.response.statusCode = HttpStatus.UNAUTHORIZED;
                } else {
                    val decoded = jwt.verify(token)
                    if (decoded == null) {
                        e.response.statusCode = HttpStatus.UNAUTHORIZED;
                    } else {
                        val uid = decoded.getClaim(Constants.LOGIN_USER_KEY).asInt()
                        if (uid == null || uid <= 0) {
                            e.response.statusCode = HttpStatus.UNAUTHORIZED;
                        } else {
                            e.attributes[Constants.LOGIN_USER_KEY] = uid
                        }
                    }
                }
                c.filter(e)
            }
        }
    }
}
