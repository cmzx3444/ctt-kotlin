package com.ctt.admin.service.login

import com.ctt.admin.dto.login.LoginRequest
import com.ctt.admin.dto.login.MobileLoginRequest
import com.ctt.admin.repository.UserRepo
import com.ctt.model.entity.User
import com.ctt.pub.jwt.Jwt
import lombok.extern.slf4j.Slf4j
import org.springframework.stereotype.Service

@Slf4j
@Service(value = LoginService.LOGIN_TYPE_MOBILE)
open class MobileLoginService(userRepo: UserRepo, jwt: Jwt)
    : AbstractLoginService(userRepo, jwt) {

    override fun createUser(loginReq: LoginRequest): User {
        val req = loginReq as MobileLoginRequest
        return User(
                nickname = req.mobile,
                mobile = req.mobile,
                username = req.mobile,
        )
    }

    override suspend fun getUser(loginReq: LoginRequest): User? {
        val req = loginReq as MobileLoginRequest
        return userRepo.findByMobile(req.mobile)
    }

}