package com.ctt.api.service.user

import com.ctt.api.repository.AddressRepo
import com.ctt.model.entity.Address
import org.springframework.stereotype.Service

@Service
class AddressService(private val addressRepo: AddressRepo) {
    fun getById(addresId: Int, userId: Int) {
    }

    suspend fun listByUserId(userId: Int): List<Address> {
        return addressRepo.findByUserId(userId);
    }

    fun save() {

    }
}