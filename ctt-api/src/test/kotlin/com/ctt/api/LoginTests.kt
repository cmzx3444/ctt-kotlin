package com.ctt.api

import com.ctt.api.dto.login.MobileLoginRequest
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.reactive.AutoConfigureWebTestClient
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.http.MediaType
import org.springframework.test.web.reactive.server.WebTestClient
import org.springframework.test.web.reactive.server.expectBody
import org.springframework.web.reactive.function.BodyInserters

@SpringBootTest
@AutoConfigureWebTestClient
class LoginTests {
    @Autowired
    private lateinit var webClient: WebTestClient

    @Test
    fun mobileLogin() {
        val req = MobileLoginRequest(code = "123456", mobile = "18667130809")
        val result = webClient.post()
                .uri("/mobile_login")
                .contentType(MediaType.APPLICATION_JSON)
                .body(BodyInserters.fromValue(req))
                .exchange()
                .expectBody<String>()
                .consumeWith { e ->
                    println(e.responseBody)
                }.returnResult()
        println("status ${result.status.value()} content ${result.responseBody}")
    }

}

