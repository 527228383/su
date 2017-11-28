package com.zl.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zl.dto.Test;

/**
 * 测试
 * @author 苏建华
 *
 * 2017年11月6日
 */
public interface TestDao {
	

	@Select("select * from tbl_user where user_name = #{userName} and pwd = #{pwd}")
	public Test login(@Param("userName") String userName, @Param("pwd") String pwd);
}
