package com.ctt.api.repository

import com.ctt.model.entity.User
import org.springframework.data.repository.kotlin.CoroutineCrudRepository
import org.springframework.stereotype.Repository

@Repository
interface UserRepo : CoroutineCrudRepository<User, Int> {
    suspend fun findByNickname(nickname: String): User?

    suspend fun findByMobile(mobile: String): User?
}