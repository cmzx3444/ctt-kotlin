package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDate
import java.time.LocalDateTime

@Table("t_store_price")
@Schema(name = "StorePrice", description = "商家")
data class StorePrice (
    @Schema(name = "Id")
    var id: Int? = null,
    @Schema(name = "productId")
    var productId: Int,
    @Schema(name = "storeId")
    var storeId: Int,
    @Schema(name = "price")
    var price: BigDecimal,
    @Schema(name = "recordDate")
    var recordDate: LocalDate,

    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,
    @Schema(name = "创建时间")
    var createTime: LocalDateTime,
    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
