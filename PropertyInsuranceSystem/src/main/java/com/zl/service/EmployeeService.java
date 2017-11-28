package com.zl.service;

import java.util.List;

import com.zl.dto.EmployeeDto;
import com.zl.dto.PositionDto;
import com.zl.util.PageUtil;
import com.zl.util.Query;

/**
 * 员工服务层接口
 * @author 苏建华
 *
 * 2017年11月7日
 */
public interface EmployeeService {
	
	/**
	 * 查询一个员工信息
	 * 苏建华
	 * 2017年11月7日
	 */
	EmployeeDto getEmployee(EmployeeDto employeeDto);
	
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
	boolean insertEmployee(EmployeeDto employeeDto);
	
	/**
	 * 删除员工
	 * 苏建华
	 * 2017年11月7日
	 */
	boolean deleteEmployee(List<String> ids);
	
	/**
	 * 获取职位列表
	 * 苏建华
	 * 2017年11月8日
	 */
	List<PositionDto> listPosition();
	
	/**
	 * 根据 id 查询员工信息
	 * 苏建华
	 * 2017年11月8日
	 */
	EmployeeDto getEmployeeById(Integer id);
	
	/**
	 * 更新员工信息
	 * 苏建华
	 * 2017年11月8日
	 */
	boolean updateEmployee(EmployeeDto employeeDto);
	
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
	String getEmployeeId(String positionId);
}
