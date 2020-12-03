package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDateTime

@Table("t_express_log")
@Schema(name = "ExpressLog对象", description = "快递变更记录")
data class ExpressLog (
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "userId")
    var userId: Int,

    @Schema(name = "expressNo")
    var expressNo: String,

    @Schema(name = "orderNo")
    var orderNo: String,

    @Schema(name = "deliveryId")
    var deliveryId: Int,

    @Schema(name = "status")
    var status: Int,

    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
