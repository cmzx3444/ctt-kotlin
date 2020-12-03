package com.ctt.pub.utils;

import org.springframework.beans.BeanUtils;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;

public class BeanConvert {
    public static <T> T to(Class<T> target, Object from, String... ignore) {
        try {
            T t = target.getConstructor().newInstance();
            BeanUtils.copyProperties(from, target, ignore);
            return t;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static <T> T to(T target, Object from, String... ignore) {
        BeanUtils.copyProperties(from, target, ignore);
        return target;
    }

    public static <T> List<T> toList(Class<T> c, List<?> from, String... ignore) {
        Constructor<T> cConstructor;
        try {
            cConstructor = c.getConstructor();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        List<T> list = new ArrayList<>();
        from.forEach(e -> {
            try {
                T b = cConstructor.newInstance();
                BeanUtils.copyProperties(e, b, ignore);
                list.add(b);
            } catch (Exception e2) {
                throw new RuntimeException(e2);
            }
        });

        return list;
    }
}
