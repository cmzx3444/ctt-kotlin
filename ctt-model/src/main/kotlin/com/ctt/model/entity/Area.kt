package com.ctt.model.entity

import io.swagger.v3.oas.annotations.media.Schema
import lombok.*
import org.springframework.data.relational.core.mapping.Table
import java.time.LocalDateTime

@Table("t_area")
@Schema(name = "Area对象", description = "县市")
data class Area(
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "provinceId")
    var provinceId: Int,

    @Schema(name = "cityId")
    var cityId: Int,

    @Schema(name = "name")
    var name: String,
)