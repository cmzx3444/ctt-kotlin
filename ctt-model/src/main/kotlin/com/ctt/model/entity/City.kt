package com.ctt.model.entity

import io.swagger.v3.oas.annotations.media.Schema
import lombok.*
import org.springframework.data.relational.core.mapping.Table
import java.time.LocalDateTime

@Table("t_city")
@Schema(name = "City对象", description = "城市")
data class City(
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "provinceId")
    var provinceId: Int,

    @Schema(name = "name")
    var name: String,
)