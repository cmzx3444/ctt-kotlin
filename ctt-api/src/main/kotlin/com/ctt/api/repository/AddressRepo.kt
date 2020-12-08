package com.ctt.api.repository

import com.ctt.model.entity.Address
import com.ctt.model.entity.User
import org.springframework.data.repository.kotlin.CoroutineCrudRepository
import org.springframework.stereotype.Repository

@Repository
interface AddressRepo : CoroutineCrudRepository<Address, Int> {

    suspend fun findByUserId(userId: Int): List<Address>
}