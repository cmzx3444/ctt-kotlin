package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDateTime

@Table("t_product_sku")
@Schema(name = "ProductSku对象", description = "产品SKU表")
data class ProductSku (
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "产品id")
    var productId: Int,

    @Schema(name = "产品名称")
    var name: String,

    @Schema(name = "产品sku规格")
    var spec: String,
    @Schema(name = "试吃，单独购买，周期配送标志位，第一位：试吃，第二位：单独购买，第三位：周期配送")
    var saleFlag: Int,
    @Schema(name = "库存")
    var inventory: Int,
    @Schema(name = "价格 试吃")
    var priceTaste: Int,
    @Schema(name = "价格 单独购买")
    var priceSingle: Int,
    @Schema(name = "价格 周期配送")
    var pricePeriod: Int,
    @Schema(name = "0 未上架，1 上架中")
    var status: Int,
    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
