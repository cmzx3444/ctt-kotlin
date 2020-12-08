package com.ctt.api

import com.ctt.api.dto.login.MobileLoginRequest
import com.ctt.pub.constants.Constants
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.reactive.AutoConfigureWebTestClient
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.http.MediaType
import org.springframework.test.web.reactive.server.WebTestClient
import org.springframework.test.web.reactive.server.expectBody
import org.springframework.web.reactive.function.BodyInserters

@SpringBootTest
@AutoConfigureWebTestClient(timeout = "1000000")//10 seconds
class UserTests {
    @Autowired
    private lateinit var webClient: WebTestClient
    private val token: String =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbjp1aWQiOjMsImlzcyI6ImxyYyIsImV4cCI6MTYwOTg2MDkwNX0.9XaqBVvEgcEtZMNoDqbI3NPTdJysZrlNrbaE8IJeanA";

    @Test
    fun userAddressList() {
        val result = webClient.get()
            .uri("/user/address/list")
            .header(Constants.HEADER_AUTH_TOKEN, token)
            .exchange()
            .expectBody<String>()
            .consumeWith { e ->
                println(e.responseBody)
            }.returnResult()
        println("status ${result.status.value()} content ${result.responseBody}")
    }

}

