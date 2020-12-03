package com.ctt.pub.utils;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DateUtils {
    private static final DateTimeFormatter DEFAULT_FORMATTER
            = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    public static Date format(String dateString) {
        LocalDateTime localDateTime = (LocalDateTime) DEFAULT_FORMATTER.parse(dateString);
        return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
    }
}
