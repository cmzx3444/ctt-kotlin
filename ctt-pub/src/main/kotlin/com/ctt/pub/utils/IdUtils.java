package com.ctt.pub.utils;

import java.util.concurrent.ThreadLocalRandom;

public class IdUtils {
    private static final ThreadLocalRandom random = ThreadLocalRandom.current();

    /**
     * 生成订单号
     * 拼接当前时间戳+用户id最后一位+用户id倒数第二位+100以内随机数
     *
     * @param userId 用户id
     * @return 订单号
     */
    public static String orderId(long userId) {
        return id("SO", userId);
    }

    public static String refundId(long userId) {
        return id("RF", userId);
    }

    public static String id(String prefix, long userId) {
        long now = System.currentTimeMillis();
        int randInt = random.nextInt(100);
        now = now * 10000 + (userId % 10L) * 1000 + ((userId / 10) % 10) * 100 + randInt;
        return prefix + now;
    }

    public static void main(String[] args) {
        System.out.println(orderId(12));
    }
}
