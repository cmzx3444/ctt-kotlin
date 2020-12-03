package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDateTime

@Table("t_order_refund")
@Schema(name = "OrderRefund对象", description = "售后单")
data class OrderRefund(
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "userId")
    var userId: Int,
    @Schema(name = "所属订单号")
    var orderNo: String,
    @Schema(name = "所属配送单id")
    var deliveryId: Int,

    @Schema(name = "售后类型 1 退货，2 换货")
    var type: Int,
    @Schema(name = "退货单号")
    var refundNo: String,
    @Schema(name = "退货状态")
    var status: Int,
    @Schema(name = "数量")
    var qty: Int,
    @Schema(name = "金额")
    var amount: String,
    @Schema(name = "退换货原因")
    var reason: String,
    @Schema(name = "凭证图片，以逗号隔开")
    var proofPics: String,
    @Schema(name = "退款金额")
    var refundAmount: Int,
    @Schema(name = "退货人姓名")
    var refundName: String,
    @Schema(name = "退货人电话")
    var refundMobile: Int,
    @Schema(name = "收货人")
    var recvName: String,
    @Schema(name = "收货人联系电话")
    var recvMobile: String,

    @Schema(name = "收货地址-省份")
    var recvProvince: String,
    @Schema(name = "收货地址-城市")
    var recvCity: String,
    @Schema(name = "收货地址-县市")
    var recvArea: String,
    @Schema(name = "收货地址-详细地址")
    var recvDetail: String,
    @Schema(name = "关联产品id")
    var productId: Int,
    @Schema(name = "关联产品名称")
    var productName: String,
    @Schema(name = "关联sku id")
    var skuId: Int,
    @Schema(name = "关联产品sku规格")
    var skuSpec: String,

    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
