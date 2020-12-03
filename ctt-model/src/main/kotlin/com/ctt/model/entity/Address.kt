package com.ctt.model.entity

import io.swagger.v3.oas.annotations.media.Schema
import lombok.*
import org.springframework.data.relational.core.mapping.Table

/**
 *
 *
 * 用户收货地址表
 *
 *
 * @author lrc
 * @since 2020-10-03
 */
@Data
@Table("t_address")
@Schema(name = "Address对象", description = "用户收货地址表")
class Address {
    @Schema(name = "用户Id")
    private val userId: Int? = null

    @Schema(name = "收货人")
    private val receiver: String? = null

    @Schema(name = "联系电话")
    private val mobile: String? = null

    @Schema(name = "邮编")
    private val postalCode: String? = null

    @Schema(name = "收货地址-省份")
    private val province: String? = null

    @Schema(name = "收货地址-城市")
    private val city: String? = null

    @Schema(name = "收货地址-县市")
    private val area: String? = null

    @Schema(name = "收货地址-详细地址")
    private val detail: String? = null

    @Schema(name = "是否默认地址 0 否，1 是")
    var isDefault = false
}