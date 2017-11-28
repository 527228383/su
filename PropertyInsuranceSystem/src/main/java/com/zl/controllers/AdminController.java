package com.zl.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.EmployeeDto;
import com.zl.dto.PolicyDto;
import com.zl.service.AdminService;
import com.zl.service.SalesService;
import com.zl.util.Global;
import com.zl.util.PageUtil;
import com.zl.util.Query;

/**
 * 管理员控制层
 * @author 苏建华
 *
 * 2017年11月8日
 */
@Controller
@Scope("prototype")
@RequestMapping("/emp/")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private SalesService salesService;
	
	/**
	 * 处理时间类型绑定问题
	 *
	 * @author 苏建华
	 * 2017年11月12日
	 */
	@InitBinder
    protected void init(HttpServletRequest request, ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }
	
	/**
	 * 根据保单号查询理赔详情
	 * 苏建华
	 * 2017年11月8日
	 */
	@RequestMapping("getClaimDetailsDto/{id}")
	public String getClaimDetailsDto(@PathVariable("id") String id){
		Object obj = Global.getSessionAttribute("employee");
		if(obj == null){
			return "service/index";
		}
		EmployeeDto employeeDto = (EmployeeDto) obj;
		ClaimDetailsDto claimDetailsDto = adminService.getClaimDetailsById(id);
		Global.setRequestAttribute("claimDetailsDto", claimDetailsDto);
		
		if("超级管理员".equals(employeeDto.getPosition_name())){
			if(claimDetailsDto.getAdmin_dicision() == null){
				return "sjh/bussiness";
			}else{
				return "sjh/bussiness-deal";
			}
		}else if("业务员".equals(employeeDto.getPosition_name())){
			return "cl/policyClaim";
		}else if("经理".equals(employeeDto.getPosition_name())){
			return "ws/policyClaim";
		}
		return "service/index";
	}
	
	/**
	 * 查询未处理的理赔列表
	 * 苏建华
	 * 2017年11月8日
	 */
	@RequestMapping("getClaimDetailsNoDealWith")
	public String getClaimDetailsNoDealWith(PageUtil pageUtil, Query query){
		pageUtil.setQuery(query);
		pageUtil.setRowSize(adminService.getRowsForNoDealWith(query));
		List<ClaimDetailsDto> noList = adminService.listClaimDetailsNoDealWith(pageUtil);
		Global.setRequestAttribute("list", noList);
		Global.setRequestAttribute("pageUtil", pageUtil);
		return "sjh/claimsDetails";
	}
	
	
	/**
	 * 查询已经处理的理赔
	 * 苏建华
	 * 2017年11月9日
	 */
	@RequestMapping("getClaimDetailsHaveDealtWith")
	public String getClaimDetailsHaveDealtWith(PageUtil pageUtil, Query query){
		pageUtil.setRowSize(adminService.getRowsForHaveDealtWith(query));
		pageUtil.setQuery(query);
		List<ClaimDetailsDto> haveList = adminService.listClaimDetailsHaveDealtWith(pageUtil);
		Global.setRequestAttribute("list", haveList);
		Global.setRequestAttribute("pageUtil", pageUtil);
		return "sjh/claimsDetails";
	}
	
	/**
	 * 查询所有理赔信息
	 * 苏建华
	 * 2017年11月9日
	 */
	@RequestMapping("getAllClaimDetails")
	public String getAllClaimDetails(String url, PageUtil pageUtil, Query query){
		pageUtil.setRowSize(adminService.getAllRows(query));
		pageUtil.setQuery(query);
		List<ClaimDetailsDto> allList = adminService.listAllClaimDetails(pageUtil);
		Global.setRequestAttribute("list", allList);
		Global.setRequestAttribute("pageUtil", pageUtil);
		return url;
	}
	
	/**
	 * 查看保单详情
	 *
	 * @author 苏建华
	 * 2017年11月17日
	 */
	@RequestMapping("getPolicyById/{id}")
	public String getPolicyById(@PathVariable("id") String id){
		PolicyDto policyDto=salesService.getPolicyById(id);
		Global.setRequestAttribute("policyDto", policyDto);
		return "sjh/policyDetail";
	}
	
}
