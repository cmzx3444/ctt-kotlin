package com.ctt.api.config

import org.springframework.http.server.reactive.ServerHttpRequest
import org.springframework.web.server.ServerWebExchange
import reactor.core.publisher.Mono
import reactor.util.context.Context
import java.util.function.Function

object ReactiveRequestContextHolder {
    private val CONTEXT_KEY = ServerWebExchange::class.java

    fun getExchange(): Mono<ServerWebExchange>? {
        return Mono.deferContextual {
            Mono.just(it)
        }.map {
            println("ReactiveRequestContextHolder "+it)
            println("ReactiveRequestContextHolder "+it.size())
            it.get(
                CONTEXT_KEY
            )
        }
    }

    fun getRequest(): Mono<ServerHttpRequest?>? {
        return getExchange()?.map<ServerHttpRequest>(
            Function { obj: ServerWebExchange -> obj.request })
    }

    fun put(context: Context, exchange: ServerWebExchange): Context {
        return context.put(CONTEXT_KEY, exchange)
    }
}