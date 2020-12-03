package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDateTime

@Table("t_order")
@Schema(name = "Order对象", description = "订单表")
data class Order (
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "userId")
    var userId: Int,


    @Schema(name = "orderNo")
    var orderNo: String,
    @Schema(name = "订单类型 1: 单独购买，2：周期配送，3：试吃")
    var type: Int,
    @Schema(name = "订单金额")
    var amount: Int,
    @Schema(name = "quantity 购买总数量")
    var qty: Int,
    @Schema(name = "订单状态, 1:待支付 2:支付中 3:订单取消 4:支付成功 5:支付失败 6:PERIOD 7:退货中 8:订单完成")
    var status: Int,
    @Schema(name = "配送计划 配送期数")
    var deliveryCount: Int,
    @Schema(name = "配送计划 没隔几个月发一期")
    var deliveryUnit: Int,
    @Schema(name = "配送计划 每次发货数量")
    var deliveryQty: Int,
    @Schema(name = "收货人")
    var recvName: String,
    @Schema(name = "联系电话")
    var recvMobile: String,
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


    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
