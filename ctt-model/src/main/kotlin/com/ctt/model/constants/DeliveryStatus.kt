package com.ctt.model.constants

enum class DeliveryStatus(val status: Int) {
    /**
     * 未发货
     */
    UN_SHIPPING(1),

    /**
     * 已发货
     */
    ON_SHIPPING(2),

    /**
     * 已送达
     */
    ARRIVED(3),
}