package com.ctt.api.controller

import com.ctt.api.dto.login.LoginResponse
import com.ctt.api.dto.login.MobileLoginRequest
import com.ctt.api.service.login.LoginService
import com.ctt.pub.result.Result
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController
import javax.validation.Valid

@Tag(description = "登陆接口", name = "xxxxx")
@RestController
class LoginController(val loginService: LoginService) {

    @PostMapping("/mobile_login")
    @Operation(summary="用户登陆")
    suspend fun mobileLogin(@RequestBody @Valid req: MobileLoginRequest): Result<LoginResponse> {
        val resp = loginService.login(req)
        return Result.of(resp)
    }
}