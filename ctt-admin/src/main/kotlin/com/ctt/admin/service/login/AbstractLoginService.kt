package com.ctt.admin.service.login

import com.ctt.admin.dto.login.LoginRequest
import com.ctt.admin.dto.login.LoginResponse
import com.ctt.admin.repository.UserRepo
import com.ctt.model.entity.User
import com.ctt.pub.constants.Constants
import com.ctt.pub.jwt.Jwt
import com.ctt.pub.utils.BeanConvert
import org.springframework.transaction.annotation.Transactional
import java.time.LocalDateTime

abstract class AbstractLoginService(
        val userRepo: UserRepo,
        val jwt: Jwt
) : LoginService {

    @Transactional
    override suspend fun login(req: LoginRequest): LoginResponse {
        validate(req)
        var user = getUser(req)
        if (user == null) {
            user = createUser(req)
            userRepo.save(user)
        } else {
            user.lastLogin = LocalDateTime.now()
            userRepo.save(user)
        }

        val token: String = jwt.token(Constants.LOGIN_USER_KEY, user.id)
        val resp = LoginResponse()
        BeanConvert.to(resp, user)
        resp.token = token
        return resp
    }

    protected open fun validate(loginReq: LoginRequest) {}

    protected abstract fun createUser(loginReq: LoginRequest): User

    protected abstract suspend fun getUser(loginReq: LoginRequest): User?
}