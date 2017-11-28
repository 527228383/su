package com.zl.service;

import com.zl.dto.InsureDto;

/**
 * 用户个人资料服务层接口
 * @author 苏明翔
 *
 * 2017年11月8日
 */

public interface Personal_InfoService {
	
	
	/**
	 * 查看个人信息
	 * 苏明翔
	 * 2017年11月8日
	 */

	public InsureDto getInsure(String ins_tel);
	
	
	/**
	 * 修改个人资料
	 * 苏明翔
	 * 2017年11月8日
	 */
	public boolean  updateInsure(InsureDto insureDto);
	
	
}
