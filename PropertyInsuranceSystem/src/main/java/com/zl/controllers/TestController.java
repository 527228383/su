package com.zl.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zl.dto.CityDto;
import com.zl.dto.Test;
import com.zl.service.AreaService;
import com.zl.service.TestService;

/**
 * 测试控制层
 * @author 苏建华
 *
 * 2017年11月6日
 */   
@RestController
public class TestController {
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private AreaService areaService;
	
	@RequestMapping("/login/{userName}/{pwd}")
	public Test login(@PathVariable("userName") String userName, @PathVariable("pwd") String pwd){
		Test user = testService.login(userName, pwd);
		return user;
	}
	
	@RequestMapping("/getProvince")
	public List<CityDto> getProvince(String code){
		return areaService.listCityByPrivinceCode(code);
	}
	
}
