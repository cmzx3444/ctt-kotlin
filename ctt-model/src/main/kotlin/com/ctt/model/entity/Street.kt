package com.ctt.model.entity

import io.swagger.v3.oas.annotations.media.Schema
import lombok.*
import org.springframework.data.relational.core.mapping.Table
import java.time.LocalDateTime

@Table("t_street")
@Schema(name = "Street对象", description = "乡级（乡镇、街道")
data class Street(
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "provinceId")
    var provinceId: Int,
    @Schema(name = "cityId")
    var cityId: Int,
    @Schema(name = "areaId")
    var areaId: Int,

    @Schema(name = "name")
    var name: String,
)