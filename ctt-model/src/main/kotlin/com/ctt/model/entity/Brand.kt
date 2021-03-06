package com.ctt.model.entity

import io.swagger.v3.oas.annotations.media.Schema
import lombok.*
import org.springframework.data.relational.core.mapping.Table
import java.time.LocalDateTime

@Table("t_brand")
@Schema(name = "Brand对象", description = "品牌")
data class Brand(
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "名称")
    var name: String,

    @Schema(name = "封面url")
    var coverUrl: String,

    @Schema(name = "品牌介绍")
    var content: String,

    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)