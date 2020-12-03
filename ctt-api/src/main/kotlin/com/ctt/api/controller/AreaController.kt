package com.ctt.api.controller

import com.ctt.api.service.login.LoginService
import org.springdoc.core.Constants
import org.springframework.beans.factory.annotation.Value
import org.springframework.http.HttpStatus
import org.springframework.http.server.reactive.ServerHttpRequest
import org.springframework.http.server.reactive.ServerHttpResponse
import org.springframework.stereotype.Controller
import org.springframework.util.AntPathMatcher
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.util.UriComponentsBuilder
import reactor.core.publisher.Mono
import java.net.URI

@Controller
class AreaController() {
    @Value(Constants.SWAGGER_UI_PATH)
    private val swaggerUiPath: String? = null

    @GetMapping(AntPathMatcher.DEFAULT_PATH_SEPARATOR)
    fun index(request: ServerHttpRequest?, response: ServerHttpResponse): Mono<Void?>? {
        if(swaggerUiPath==null){
            return response.setComplete()
        }
        val uriBuilder = UriComponentsBuilder.fromUriString(swaggerUiPath)
        response.statusCode = HttpStatus.TEMPORARY_REDIRECT
        response.headers.location = URI.create(uriBuilder.build().encode().toString())
        return response.setComplete()
    }
}