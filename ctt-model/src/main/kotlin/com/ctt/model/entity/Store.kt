package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDateTime

@Table("t_store")
@Schema(name = "Store对象", description = "商家")
data class Store (
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "商家名称")
    var name: String,
    @Schema(name = "产品sku规格")
    var spec: String,
    @Schema(name = "0 淘宝，1 京东")
    var type: Int,
    @Schema(name = "商家链接")
    var link: String,
    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,
    @Schema(name = "创建时间")
    var createTime: LocalDateTime,
    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
