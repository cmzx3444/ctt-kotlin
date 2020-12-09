package com.ctt.api.config

import org.springframework.http.server.reactive.ServerHttpRequest
import org.springframework.web.server.ServerWebExchange
import reactor.core.publisher.Mono
import reactor.util.context.Context

object ReactiveRequestContextHolder {
    private val CONTEXT_KEY = ServerWebExchange::class.java

    /**
     * Gets the `Mono<ServerWebExchange>` from Reactor [Context]
     *
     * @return the `Mono<ServerWebExchange>`
     */
    fun getExchange(): Mono<ServerWebExchange> {
        /**
         * mica中是这么写的，但是我这样写一直会报错 content is null;
         */
//		return Mono.subscriberContext()
//				.map(ctx -> ctx.get(CONTEXT_KEY));
        /**
         * 下面是我仿照Security中的改写的。
         */
        return Mono.deferContextual {
            if (it.hasKey(CONTEXT_KEY)) {
                Mono.just(it.get(CONTEXT_KEY))
            } else {
                Mono.empty()
            }
        }
    }

    /**
     * Gets the `Mono<ServerHttpRequest>` from Reactor [Context]
     *
     * @return the `Mono<ServerHttpRequest>`
     */
    fun getRequest(): Mono<ServerHttpRequest?> {
        return getExchange()
            .map { obj: ServerWebExchange -> obj.request }
    }

    /**
     * Put the `ServerWebExchange` to Reactor [Context]
     *
     * @param context  Context
     * @param exchange ServerWebExchange
     * @return the Reactor [Context]
     */
    fun put(context: Context, exchange: ServerWebExchange): Context {
        return context.put(CONTEXT_KEY, exchange)
    }
}