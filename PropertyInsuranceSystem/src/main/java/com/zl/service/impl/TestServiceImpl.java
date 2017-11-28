package com.zl.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.dao.TestDao;
import com.zl.dto.Test;
import com.zl.service.TestService;

/**
 * 测试服务层
 * @author 苏建华
 *
 * 2017年11月6日
 */
@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDao testDao;

	@Override
	public Test login(String userName, String pwd) {
		return testDao.login(userName, pwd);
	}
	
	

}
