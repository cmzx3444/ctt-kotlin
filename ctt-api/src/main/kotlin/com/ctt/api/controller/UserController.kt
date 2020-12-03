package com.ctt.api.controller

import com.ctt.api.dto.login.LoginResponse
import com.ctt.api.dto.login.MobileLoginRequest
import com.ctt.api.dto.user.AddressVo
import com.ctt.api.service.login.LoginService
import com.ctt.pub.result.Result
import io.swagger.v3.oas.annotations.media.Content
import io.swagger.v3.oas.annotations.media.Schema
import io.swagger.v3.oas.annotations.responses.ApiResponse
import io.swagger.v3.oas.annotations.responses.ApiResponses
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController
import javax.validation.Valid

@Tag(description = "用户相关操作接口", name = "xxxxx")
@RestController
class UserController(val loginService: LoginService) {

    @GetMapping("/address/list")
    suspend fun addressList(@RequestBody @Valid req: MobileLoginRequest): Result<List<AddressVo>> {
        return Result.of()
    }

    @PostMapping("/address/save")
    suspend fun addressSave(@RequestBody @Valid vo: AddressVo): Result<Void> {
        return Result.of();
    }
}