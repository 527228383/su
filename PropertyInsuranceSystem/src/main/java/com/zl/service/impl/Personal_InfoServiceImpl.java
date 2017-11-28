package com.zl.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.dao.Personal_InfoDao;
import com.zl.dto.InsureDto;
import com.zl.service.Personal_InfoService;

@Service
public class Personal_InfoServiceImpl  implements Personal_InfoService  {
	/**
	 * 注入Dao层
	 * 苏明翔
	 * 2017年11月8日
	 */
	@Autowired
	private Personal_InfoDao personal_InfoDao;

	
	/**
	 * 查看个人资料
	 * 苏明翔
	 * 2017年11月10日
	 */
	@Override
	public InsureDto getInsure( String ins_tel) {
			return personal_InfoDao.getPersonInfoByIns_tel(ins_tel);
	}


	/**
	 * 修改个人资料
	 * 苏明翔
	 * 2017年11月10日
	 */ 
	@Override
	public boolean updateInsure(InsureDto insureDto) {
		int flg=personal_InfoDao.updatePersonalInfo(insureDto);
		return flg > 0 ? true : false;
		    
	}


	


	
	

	
}
