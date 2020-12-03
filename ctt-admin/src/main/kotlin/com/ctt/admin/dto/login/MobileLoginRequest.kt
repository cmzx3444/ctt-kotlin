package com.ctt.admin.dto.login

import io.swagger.v3.oas.annotations.media.Schema
import javax.validation.constraints.NotBlank
import javax.validation.constraints.Size

@Schema(description = "ssasdas",name = "xxxdsa")
class MobileLoginRequest(
        @NotBlank(message = "验证码不能为空")
        @Size(min = 4, max = 6, message = "验证码不合法")
        @Schema(name = "code")
        var code: String,

        @Size(min = 11, max = 11, message = "手机号不正确")
        @Schema(name = "mobile")
        var mobile: String,
) : LoginRequest