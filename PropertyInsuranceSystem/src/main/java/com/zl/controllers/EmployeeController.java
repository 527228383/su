package com.zl.controllers;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zl.dto.CityDto;
import com.zl.dto.EmployeeDto;
import com.zl.dto.PositionDto;
import com.zl.dto.ProvinceDto;
import com.zl.service.AreaService;
import com.zl.service.EmployeeService;
import com.zl.util.Global;
import com.zl.util.PageUtil;
import com.zl.util.Query;

/**
 * 员工控制层
 * @author 苏建华
 *
 * 2017年11月6日
 */
@Scope("prototype")
@Controller
@RequestMapping("/emp/")
public class EmployeeController {
	
	/**
	 * 注入 EmployeeService
	 */
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private AreaService areaService;
	
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
	 * 员工登录
	 * 苏建华
	 * 2017年11月7日
	 */
	@RequestMapping(value = "login/{emp_name}/{emp_pwd}", method = RequestMethod.POST)
	public void empLogin(@PathVariable("emp_name") String emp_name, @PathVariable("emp_pwd") String emp_pwd, HttpServletRequest req, HttpServletResponse res){
		PrintWriter writer = null;
		try{
			EmployeeDto employeeDto = new EmployeeDto();
			employeeDto.setEmp_name(emp_name);
			employeeDto.setEmp_pwd(emp_pwd);
			employeeDto = employeeService.getEmployee(employeeDto);
			writer = res.getWriter();
			String result = "";
			if(employeeDto != null) {
				Global.setSessionAttribute("employee", employeeDto);
				// {\"mess\":true, \"position\": \"超级管理员\"}
				result = "{\"mess\":true, \"position\": \"" + employeeDto.getEmp_position_id() + "\"}";
			} else {
				result = "{\"mess\" : false}";
			}
			writer.write(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			writer.close();
		}
	}
	
	/**
	 * 获取员工列表
	 * 苏建华
	 * 2017年11月7日
	 */
	@RequestMapping("getEmpList")
	public String getEmpList(PageUtil pageUtil, Query query, BindingResult bindingResult){
		if(pageUtil.getCurrentPage() == null){
			pageUtil.setCurrentPage(1);
		}
		//将模糊查询对象放入分页对象中
		pageUtil.setQuery(query);
		// 设置信息总条数
		pageUtil.setRowSize(employeeService.getEmpRows(query));
		List<EmployeeDto> empList = employeeService.listEmployeeByFenYe(pageUtil);
		Global.setRequestAttribute("list", empList);
		Global.setRequestAttribute("pageUtil", pageUtil);
		return "sjh/empDetails";
	}
	
	/**
	 * 跳转添加页面
	 * 苏建华
	 * 2017年11月8日
	 */
	@RequestMapping("jumpToAddPage")
	public String jumpToAddPage(){
		List<PositionDto> posList = employeeService.listPosition();
		List<ProvinceDto> priList = areaService.listProvince();
		Global.setRequestAttribute("posList", posList);
		Global.setRequestAttribute("priList", priList);
		return "sjh/addEmp";
	}
	
	/**
	 * 根据省份编号查询城市列表
	 * 苏建华
	 * 2017年11月8日
	 */
	@RequestMapping("getCityByPriCode/{privince_code}")
	@ResponseBody
	public List<CityDto> getCityByPriCode(@PathVariable("privince_code") String privince_code){
		List<CityDto> citiList = areaService.listCityByPrivinceCode(privince_code);
		return citiList;
	}
	
	/**
	 * 添加员工
	 * 苏建华
	 * 2017年11月7日
	 */
	@RequestMapping("addEmployee")
	public String addEmployee(EmployeeDto employeeDto){
		boolean flag = employeeService.insertEmployee(employeeDto);
		if(flag){
			return "redirect:/emp/getEmpList";
		}
		return "service/index";
	}
	
	/**
	 * 删除员工
	 * 苏建华
	 * 2017年11月7日
	 */
	@RequestMapping("deleteEmployee")
	public String deleteEmployee(String[] ids){
		//将数组转换成 list 集合
		List<String> idList = Arrays.asList(ids);
		boolean flag = employeeService.deleteEmployee(idList);
		if(flag){
			return "redirect:/emp/getEmpList";
		}
		return "service/index";
	}
	
	/**
	 * 根据 id 查询要修改的员工
	 * 苏建华
	 * 2017年11月8日
	 */
	@RequestMapping("jumpToUpdatePage/{id}")
	public String jumpToUpdatePage(@PathVariable("id") String id){
		EmployeeDto employeeDto = employeeService.getEmployeeById(Integer.parseInt(id));
		List<PositionDto> posList = employeeService.listPosition();
		List<ProvinceDto> listProvince = areaService.listProvince();
		Global.setRequestAttribute("upEmp", employeeDto);
		Global.setRequestAttribute("list", posList);
		Global.setRequestAttribute("listProvince", listProvince);
		return "sjh/updateEmp";
	}
	
	/**
	 * 更新员工信息
	 * 苏建华
	 * 2017年11月8日
	 */
	@RequestMapping("updateEmployee")
	public String updateEmployee(EmployeeDto employeeDto){
		boolean flag = employeeService.updateEmployee(employeeDto);
		if(flag){
			return "redirect:/emp/getEmpList";
		}
		return "service/index";
	}
	
	/**
	 * 退出登录
	 * 苏建华
	 * 2017年11月8日
	 */
	@RequestMapping("exit")
	public String exit(HttpServletRequest req){
		//清除session信息
		Global.getHttpSession().invalidate();
		return "redirect:/emp";
	}
	
}
