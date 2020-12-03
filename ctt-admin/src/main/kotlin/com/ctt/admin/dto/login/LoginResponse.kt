package com.ctt.admin.dto.login

import io.swagger.v3.oas.annotations.media.Schema
import lombok.Data
import java.time.LocalDateTime


@Data
@Schema(description = "sss",name = "xxxdsa")
data class LoginResponse(
        @Schema(name = "token")
        var token: String? = null,

        @Schema(name = "用户名")
        var username: String? = null,

        @Schema(name = "昵称")
        var nickname: String? = null,

        @Schema(name = "手机号")
        var mobile: String? = null,

        @Schema(name = "状态")
        var status: Int = 0,

        @Schema(name = "标志")
        var flag: Int = 0,

        var lastLogin: LocalDateTime? = null,
        var createTime: LocalDateTime? = null,
        var updateTime: LocalDateTime? = null
)