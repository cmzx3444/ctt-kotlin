package com.ctt.api.service.user

import com.ctt.api.repository.UserRepo
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class UserService(val userRepo: UserRepo) {

    @Transactional
    suspend fun save() {

    }
}