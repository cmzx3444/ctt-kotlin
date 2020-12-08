package com.ctt.api.config

import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication
import org.springframework.core.Ordered
import org.springframework.stereotype.Component
import org.springframework.web.server.ServerWebExchange
import org.springframework.web.server.WebFilter
import org.springframework.web.server.WebFilterChain
import reactor.core.publisher.Mono

@Component
@ConditionalOnWebApplication(type = ConditionalOnWebApplication.Type.REACTIVE)
class ReactiveRequestContextFilter : WebFilter, Ordered {

    override fun filter(exchange: ServerWebExchange, chain: WebFilterChain): Mono<Void> {
        println("xxx ReactiveRequestContextFilter")
        return chain.filter(exchange)
            .contextWrite {
                println("xxxx0  " + it)
                println("xxxx1  " + it::class)
                println("xxxx2  " + it.size())
                val ctx = ReactiveRequestContextHolder.put(it, exchange)
                println("xxxx3  " + it.size())
                println("xxxx3  " + ctx.size())
                ctx
            }
    }

    override fun getOrder(): Int {
        return -9999;
    }
}