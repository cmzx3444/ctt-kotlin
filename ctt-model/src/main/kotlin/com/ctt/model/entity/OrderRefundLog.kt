package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDateTime

@Table("t_order_refund_log")
@Schema(name = "OrderRefundLog对象", description = "售后处理日志")
data class OrderRefundLog(
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "userId")
    var userId: Int,
    @Schema(name = "所属订单号")
    var orderNo: String,
    @Schema(name = "所属配送单id")
    var deliveryId: Int,
    @Schema(name = "退货单号")
    var refundNo: String,
    @Schema(name = "处理备注")
    var handleNote: String,
    @Schema(name = "处理人员")
    var handleMan: String,

    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
