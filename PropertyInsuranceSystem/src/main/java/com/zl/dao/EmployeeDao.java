package com.zl.dao;

import java.util.List;

import com.zl.dto.EmployeeDto;
import com.zl.dto.PositionDto;
import com.zl.util.PageUtil;
import com.zl.util.Query;

/**
 * 员工 dao 层
 * @author 苏建华
 *
 * 2017年11月6日
 */
public interface EmployeeDao {
	
	/**
	 * 员工登录/查询一个员工信息
	 * 苏建华
	 * 2017年11月6日
	 */
	public EmployeeDto getEmployeeByNameAndPwd(EmployeeDto employeeDto);
	
	/**
	 * 根据id 查询员工信息
	 * 苏建华
	 * 2017年11月8日
	 */
	EmployeeDto getEmployeeById(Integer id);
	
	/**
	 * 查询员工列表
	 * 苏建华
	 * 2017年11月7日
	 */
	List<EmployeeDto> listEmployeeByFenYe(PageUtil pageUtil);
	
	/**
	 * 添加员工
	 * 苏建华
	 * 2017年11月7日
	 */
	int insertEmployee(EmployeeDto employeeDto);
	
	/**
	 * 删除员工
	 * 苏建华
	 * 2017年11月7日
	 */
	int deleteEmployee(List<String> ids);
	
	/**
	 * 更新员工信息
	 * 苏建华
	 * 2017年11月8日
	 */
	int updateEmployee(EmployeeDto employeeDto);
	
	/**
	 * 获取职位列表
	 * 苏建华
	 * 2017年11月8日
	 */
	List<PositionDto> listPosition();
	
	/**
	 * 查询员工列表的条数
	 * 苏建华
	 * 2017年11月9日
	 */
	int getEmpRows(Query query);
	
	/**
	 * 根据职位获取员工姓名
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	public String getEmployeeId(String positionId);
}
