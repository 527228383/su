package com.zl.dao;

import com.zl.dto.InsureDto;

/**
 * 个人资料
 * @author 苏明翔
 *
 * 2017年11月8日
 */

public interface Personal_InfoDao {
	/**
	 * 根据电话号码查看个人资料
	 * 苏明翔
	 * 2017年11月8日
	 */

	public InsureDto getPersonInfoByIns_tel(String ins_tel);
	
	/**
	 * 修改个人资料
	 * 苏明翔
	 * 2017年11月8日
	 */
	public int updatePersonalInfo(InsureDto insureDto);
}
