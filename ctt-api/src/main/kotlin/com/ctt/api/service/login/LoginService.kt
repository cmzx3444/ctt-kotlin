package com.ctt.api.service.login

import com.ctt.api.dto.login.LoginRequest
import com.ctt.api.dto.login.LoginResponse

interface LoginService {

    companion object {
        const val LOGIN_TYPE_WX = "wx_login"
        const val LOGIN_TYPE_MOBILE = "mobile_login"
    }

    /**
     * 用户登陆，当用户不存在时自动注册
     */
    suspend fun login(req: LoginRequest): LoginResponse
}