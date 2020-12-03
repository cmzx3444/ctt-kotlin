package com.ctt.pub.entity

import lombok.Builder
import lombok.Data
import java.time.LocalDateTime

@Data
@Builder
open class BaseEntity {
    private var id: Int? = null
    private var deleted: Boolean = false
    private var createTime: LocalDateTime? = null
    private var updateTime: LocalDateTime? = null
}