package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDateTime

@Table("t_order_item")
@Schema(name = "OrderItem对象", description = "订单条目表")
data class OrderItem(
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "userId")
    var userId: Int,

    @Schema(name = "订单号")
    var orderNo: String,
    @Schema(name = "产品Id")
    var productId: Int,
    @Schema(name = "产品名称")
    var productName: String,
    @Schema(name = "产品封面图片url")
    var productCoverUrl: String,
    @Schema(name = "产品图片url")
    var productDetailUrl: Int,
    @Schema(name = "产品sku")
    var skuId: Int,
    @Schema(name = "产品sku规格")
    var skuSpec: String,
    @Schema(name = "产品类型，1 普通商品，2 待扩展")
    var type: Int,
    @Schema(name = "金额")
    var amount: Int,
    @Schema(name = "单价")
    var price: Int,
    @Schema(name = "数量")
    var qty: Int,

    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
