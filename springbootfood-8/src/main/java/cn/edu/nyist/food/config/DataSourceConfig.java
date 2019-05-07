package cn.edu.nyist.food.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import com.alibaba.druid.pool.DruidDataSource;

@Configuration
public class DataSourceConfig {
	@Autowired
	  private Environment en;
	  @Bean(name="dataSource")
	  public DataSource getDataSource() {
		 
		  DruidDataSource ds = new DruidDataSource();
		  ds.setUsername(en.getProperty("spring.datasource.username").trim());
		  ds.setPassword(en.getProperty("spring.datasource.password").trim());
		  ds.setUrl(en.getProperty("spring.datasource.url").trim());
	      ds.setDriverClassName(en.getProperty("spring.datasource.driverClassName").trim());
	      return ds;
	  }
}
