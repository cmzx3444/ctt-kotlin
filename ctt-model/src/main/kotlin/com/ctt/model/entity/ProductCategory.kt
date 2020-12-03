package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDateTime

@Table("t_product_category")
@Schema(name = "ProductCategory对象", description = "产品分类表")
data class ProductCategory (
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "品牌Id")
    var brandId: Int,

    @Schema(name = "分类Id")
    var categoryId: Int,

    @Schema(name = "产品名称")
    var name: String,

    @Schema(name = "封面图片url")
    var coverUrl: String,
    @Schema(name = "lft")
    var lft: Int,
    @Schema(name = "rght")
    var rght: Int,
    @Schema(name = "treeId")
    var treeId: Int,
    @Schema(name = "分类层级")
    var level: Int,
    @Schema(name = "父类Id")
    var parentId: Int,

    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
