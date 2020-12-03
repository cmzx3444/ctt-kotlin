package com.ctt.admin.config

import org.springframework.web.reactive.function.server.HandlerFilterFunction
import org.springframework.web.reactive.function.server.HandlerFunction
import org.springframework.web.reactive.function.server.ServerRequest
import org.springframework.web.reactive.function.server.ServerResponse
import reactor.core.publisher.Mono


open class LoginFilter : HandlerFilterFunction<ServerResponse?, ServerResponse?> {
    override fun filter(serverRequest: ServerRequest,
                        handlerFunction: HandlerFunction<ServerResponse?>): Mono<ServerResponse?> {
        return if (serverRequest.pathVariable("name").equals("test", ignoreCase = true)) {
            ServerResponse.status(401).build()
        } else handlerFunction.handle(serverRequest)
    }
}