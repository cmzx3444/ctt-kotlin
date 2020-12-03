package com.ctt.model.entity

import io.swagger.v3.oas.annotations.media.Schema
import lombok.*
import org.springframework.data.relational.core.mapping.Table
import java.time.LocalDateTime

@Table("t_province")
@Schema(name = "Province对象", description = "省份")
data class Province(
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "name")
    var name: String,
)