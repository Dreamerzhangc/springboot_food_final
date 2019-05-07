package cn.edu.nyist.food.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
@Configuration
public class ResourceConfig extends WebMvcConfigurerAdapter{
	  @Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
			registry.addResourceHandler("/upload/**").addResourceLocations("/WEB-INF/upload/");
			
	  }
}
