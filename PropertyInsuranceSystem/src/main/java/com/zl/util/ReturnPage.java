package com.zl.util;

import com.zl.dto.EmployeeDto;

/**
 * 跳转页面工具
 *
 * @author 苏建华
 * 2017年11月16日
 */
public class ReturnPage {
	
	/**
	 * 未处理跳转页面
	 *
	 * @author 苏建华
	 * 2017年11月16日
	 */
	public static String getNoDealWithReturnPage(){
		Object obj = Global.getSessionAttribute("employee");
		if(obj == null){
			return "service/index";
		}
		EmployeeDto employeeDto = (EmployeeDto) obj;
		if("超级管理员".equals(employeeDto.getPosition_name())){
			return "sjh/claimsDetails-no";
		}else if("经理".equals(employeeDto.getPosition_name())){
			return "ws/mger_main";
		}else if("业务员".equals(employeeDto.getPosition_name())){
			return "cl/policyForClaim";
		}
		return "service/index";
	}
	
	/**
	 * 已处理跳转页面
	 *
	 * @author 苏建华
	 * 2017年11月16日
	 */
	public static String getHaveDealWithReturnPage(){
		Object obj = Global.getSessionAttribute("employee");
		if(obj == null){
			return "service/index";
		}
		EmployeeDto employeeDto = (EmployeeDto) obj;
		if("超级管理员".equals(employeeDto.getPosition_name())){
			return "sjh/claimsDetails-have";
		}else if("经理".equals(employeeDto.getPosition_name())){
			return "ws/haveDel";
		}else if("业务员".equals(employeeDto.getPosition_name())){
			return "cl/policyClaimed";
		}
		return "service/index";
	}
	
	/**
	 * 所有跳转页面
	 *
	 * @author 苏建华
	 * 2017年11月16日
	 */
	public static String getAllDealWithReturnPage(){
		Object obj = Global.getSessionAttribute("employee");
		if(obj == null){
			return "service/index";
		}
		EmployeeDto employeeDto = (EmployeeDto) obj;
		if("超级管理员".equals(employeeDto.getPosition_name())){
			return "sjh/claimsDetails-all";
		}else if("经理".equals(employeeDto.getPosition_name())){
			return "ws/allDel";
		}else if("业务员".equals(employeeDto.getPosition_name())){
			return "cl/policy";
		}
		return "service/index";
	}
	
}
