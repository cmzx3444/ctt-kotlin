package com.ctt.api.service.user

import com.ctt.api.config.ReactiveRequestContextHolder
import com.ctt.api.repository.UserRepo
import com.ctt.model.entity.User
import com.ctt.pub.constants.Constants
import org.springframework.stereotype.Component

@Component
class UserContext(userRepo: UserRepo) {
    init {
        INSTANCE = this
    }

    companion object {
        lateinit var INSTANCE: UserContext;
        suspend fun get(): User {
            return INSTANCE.getLoginUser()
        }
    }

    suspend fun getLoginUser(): User {
        val req = ReactiveRequestContextHolder.getRequest();
        if (req == null) {
            println("req==null ")
            return User(id = 1);
        }
        req.subscribe {
            println("xxxxx " + it)
            if (it != null) {
                println("xxxxx " + it.headers[Constants.HEADER_AUTH_TOKEN])
            }
        }
        return User(id = 1);
    }
}
