package com.ctt.model.entity;

import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.data.relational.core.mapping.Table

import java.math.BigDecimal;
import java.time.LocalDateTime

@Table("t_notice_record")
@Schema(name = "NoticeRecord对象", description = "降价通知记录")
data class NoticeRecord (
    @Schema(name = "Id")
    var id: Int? = null,

    @Schema(name = "降价通知Id")
    var noticeId: Int,

    @Schema(name = "是否已读，0 已读，1 已读")
    var isRead: Boolean,

    @Schema(name = "是否删除 0 否，1 是")
    var deleted: Boolean = false,

    @Schema(name = "创建时间")
    var createTime: LocalDateTime,

    @Schema(name = "修改时间")
    var updateTime: LocalDateTime,
)
