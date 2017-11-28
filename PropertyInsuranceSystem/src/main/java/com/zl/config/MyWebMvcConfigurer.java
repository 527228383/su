package com.zl.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.zl.interceptor.ErrorInterceptor;

/**
 * 设置默认首页
 * @author 苏建华
 *
 * 2017年11月6日
 */
@Configuration
public class MyWebMvcConfigurer extends WebMvcConfigurerAdapter {

	/**
	 * 
	 * 苏建华
	 * 2017年11月6日
	 */
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("index");
		registry.addViewController("/emp").setViewName("service/index");
		super.addViewControllers(registry);
	}

	/**
	 * 添加自定义拦截器
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new ErrorInterceptor()).addPathPatterns("/**");
		super.addInterceptors(registry);
	}

	

}
