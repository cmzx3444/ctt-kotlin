package com.ctt.api.dto.user

import io.swagger.v3.oas.annotations.media.Schema
import java.time.LocalDateTime

@Schema(name = "收货地址", description = "用户收货地址表")
data class AddressVo(
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "用户Id")
    var userId: Int,

    @Schema(name = "收货人")
    var receiver: String,

    @Schema(name = "联系电话")
    var mobile: String,

    @Schema(name = "邮编")
    var postalCode: String,

    @Schema(name = "收货地址-省份")
    var province: String,

    @Schema(name = "收货地址-城市")
    var city: String,

    @Schema(name = "收货地址-县市")
    var area: String,

    @Schema(name = "收货地址-详细地址")
    var detail: String,

    @Schema(name = "是否默认地址 0 否，1 是")
    var isDefault: Boolean = false,

    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
