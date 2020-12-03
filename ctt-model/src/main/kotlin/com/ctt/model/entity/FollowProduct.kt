package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDateTime

@Table("t_follow_product")
@Schema(name = "FollowProduct对象", description = "产品收藏表")
data class FollowProduct (
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "userId")
    var userId: Int,

    @Schema(name = "productId")
    var productId: Int,

    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
