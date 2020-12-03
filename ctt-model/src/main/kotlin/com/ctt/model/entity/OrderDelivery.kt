package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDate
import java.time.LocalDateTime

@Table("t_order_delivery")
@Schema(name = "OrderDelivery对象", description = "配送单")
data class OrderDelivery (
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "用户Id")
    var userId: Int,
    @Schema(name = "所属订单号")
    var orderNo: String,
    @Schema(name = "配送状态 1:未发货 2:已发货 3:已签收")
    var status: Int,
    @Schema(name = "配送数量")
    var qty: Int,
    @Schema(name = "当前配送单金额")
    var amount: Int,
    @Schema(name = "第几个配送周期")
    var periods: Int,
    @Schema(name = "关联产品id")
    var productId: Int,
    @Schema(name = "关联产品sku名称")
    var productName: String,
    @Schema(name = "关联sku id")
    var skuId: Int,
    @Schema(name = "关联产品sku规格")
    var skuSpec: String,
    @Schema(name = "收货人")
    var recvName: Int,
    @Schema(name = "联系电话")
    var recvMobile: Int,
    @Schema(name = "收货地址-省份")
    var recvProvince: String,
    @Schema(name = "收货地址-城市")
    var recvCity: String,
    @Schema(name = "收货地址-县市")
    var recvArea: String,
    @Schema(name = "收货地址-详细地址")
    var recvDetail: String,
    @Schema(name = "快递单号")
    var expressNo: String,
    @Schema(name = "配送时间")
    var deliveryDate: LocalDate,

    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
