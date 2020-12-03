package com.ctt.pub.config;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;

@Component
@RequiredArgsConstructor
public class DataSourceChecker implements InitializingBean {
    private final DataSource dataSource;

    @Override
    public void afterPropertiesSet() throws Exception {
        dataSource.getConnection().close();
    }
}
