package com.ctt.pub.utils;

import java.util.Random;

public class RandomUtils {
    private static final String NUM = "0123456789";
    private static final String AZ09 = "abcdefghijklmnopqrstuvwxyz0123456789";

    public static String getRandomString(Integer num) {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < num; i++) {
            int number = random.nextInt(AZ09.length());
            sb.append(AZ09.charAt(number));
        }
        return sb.toString();
    }

    public static String getRandomNum(Integer num) {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < num; i++) {
            int number = random.nextInt(NUM.length());
            sb.append(NUM.charAt(number));
        }
        return sb.toString();
    }
}
