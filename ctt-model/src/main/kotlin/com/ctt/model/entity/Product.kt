package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDateTime

@Table("t_product")
@Schema(name = "Product对象", description = "产品表")
data class Product (
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "品牌Id")
    var brandId: Int,

    @Schema(name = "分类Id")
    var categoryId: Int,

    @Schema(name = "产品名称")
    var name: String,

    @Schema(name = "stage")
    var stage: String,
    @Schema(name = "产地，来源")
    var origin: String,
    @Schema(name = "收藏数")
    var likes: Int,
    @Schema(name = "浏览量")
    var views: Int,
    @Schema(name = "评论数")
    var comments: Int,
    @Schema(name = "产品描述")
    var content: String,
    @Schema(name = "封面图片url")
    var coverUrl: String,
    @Schema(name = "详情页面图片url")
    var detailUrl: String,
    @Schema(name = "0 未上架，1 上架中")
    var status: Int,


    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
