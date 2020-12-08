package com.ctt.api.controller

import com.ctt.api.dto.user.AddressVo
import com.ctt.api.service.user.AddressService
import com.ctt.api.service.user.UserContext
import com.ctt.model.entity.Address
import com.ctt.pub.result.Result
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.web.bind.annotation.*
import javax.validation.Valid

@Tag(description = "用户相关操作接口", name = "User")
@RestController
@RequestMapping("/user/")
class UserController(
    private val userContext: UserContext,
    private val addressService: AddressService
) {

    @GetMapping("/address/list")
    suspend fun addressList(): Result<List<Address>> {
        val user = userContext.getLoginUser();
        println(user)
        val list = addressService.listByUserId(user.id)
        return Result.of(list)
    }

    @PostMapping("/address/save")
    suspend fun addressSave(@RequestBody @Valid vo: AddressVo): Result<Void> {
        return Result.of(null);
    }
}