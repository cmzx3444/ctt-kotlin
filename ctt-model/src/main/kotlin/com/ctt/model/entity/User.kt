package com.ctt.model.entity

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.annotation.Id
import org.springframework.data.relational.core.mapping.Table
import java.time.LocalDateTime

@Table("t_user")
@Schema(name = "用户对象", description = "用户对象")
data class User(
        @Id
        @Schema(name = "用户Id",description = "用户Id")
        val id: Int = 0,
        @Schema(name = "用户Id",description = "用户Id")
        val username: String = "",
        @Schema(name = "用户Id",description = "用户Id")
        val password: String = "",
        @Schema(name = "用户Id",description = "用户Id")
        val nickname: String = "",
        @Schema(name = "用户Id",description = "用户Id")
        val mobile: String = "",
        @Schema(name = "用户Id",description = "用户Id")
        val unionId: String = "",
        @Schema(name = "用户Id",description = "用户Id")
        val openId: String = "",
        @Schema(name = "用户Id",description = "用户Id")
        val sessionKey: String = "",
        @Schema(name = "用户Id",description = "用户Id")
        val status: Int = 0,
        @Schema(name = "用户Id",description = "用户Id")
        val flag: Int = 0,
        @Schema(name = "用户Id",description = "用户Id")
        var lastLogin: LocalDateTime = LocalDateTime.now(),
        @Schema(name = "用户Id",description = "用户Id")
        val deleted: Boolean = false,
        @Schema(name = "用户Id",description = "用户Id")
        val createTime: LocalDateTime? = LocalDateTime.now(),
        @Schema(name = "用户Id",description = "用户Id")
        val updateTime: LocalDateTime? = LocalDateTime.now()
)


