package com.ctt.admin.controller

import com.ctt.admin.dto.login.LoginResponse
import com.ctt.admin.dto.login.MobileLoginRequest
import com.ctt.admin.service.login.LoginService
import com.ctt.pub.result.Result
import io.swagger.v3.oas.annotations.media.Content
import io.swagger.v3.oas.annotations.media.Schema
import io.swagger.v3.oas.annotations.responses.ApiResponse
import io.swagger.v3.oas.annotations.responses.ApiResponses
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController
import javax.validation.Valid

@Tag(description = "登陆接口",name = "xxxxx")
@RestController
class LoginController(val loginService: LoginService) {

    @PostMapping("/mobile_login")
    @ApiResponses(value=[ApiResponse(
            content=[
                Content(
                        schema=  Schema(
                                name="s",
                                implementation = LoginResponse::class
                        )
                )
            ]
    ) ])
    suspend fun mobileLogin(@RequestBody @Valid req: MobileLoginRequest): Result<LoginResponse> {
        val resp = loginService.login(req)
        return Result.of(resp)
    }
}