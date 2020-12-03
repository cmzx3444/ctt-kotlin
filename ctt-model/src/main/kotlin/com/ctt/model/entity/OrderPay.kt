package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDateTime

@Table("t_order_pay")
@Schema(name = "OrderPay对象", description = "订单支付记录")
data class OrderPay (
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "用户Id")
    var userId: Int,
    @Schema(name = "所属订单号")
    var orderNo: String,


    @Schema(name = "支付流水号")
    var payNo: String,
    @Schema(name = "微信支付流水号")
    var wxTransactionId: String,
    @Schema(name = "实际收到的金额")
    var amount: Int,
    @Schema(name = "1 购买，2 退货")
    var type: Int,
    @Schema(name = "支付状态 0 未支付，1 支付成功，2支付失败")
    var status: Int,
    @Schema(name = "支付渠道 wechat alipay")
    var channel: String,
    @Schema(name = "客户端平台 android ios wechat alipay")
    var platform: Int,

    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
