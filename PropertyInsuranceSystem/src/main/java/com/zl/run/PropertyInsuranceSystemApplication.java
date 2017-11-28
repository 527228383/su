package com.zl.run;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 项目启动类
 * @author 苏建华
 *
 * 2017年11月6日
 */

@SpringBootApplication
@MapperScan("com.zl.dao") //dao 层扫描
@EnableTransactionManagement // 开启事务
@ComponentScan("com.zl")
public class PropertyInsuranceSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(PropertyInsuranceSystemApplication.class, args);
	}
}
