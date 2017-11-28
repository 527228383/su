package com.zl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zl.dao.EmployeeDao;
import com.zl.dto.EmployeeDto;
import com.zl.dto.PositionDto;
import com.zl.service.ActivitiService;
import com.zl.service.EmployeeService;
import com.zl.util.PageUtil;
import com.zl.util.Query;

/**
 * 员工服务层实现类
 * @author 苏建华
 *
 * 2017年11月7日
 */
@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	/**
	 * 注入 dao 层
	 * @author 苏建华
	 *
	 * 2017年11月7日
	 */
	@Autowired
	private EmployeeDao employeeDao;
	
	@Autowired
	ActivitiService activitiService;
	
	
	/** 
	 * 获取一个员工信息/登录
	 * 苏建华
	 * 2017年11月7日
	 */
	@Override
	@Cacheable(value = "getEmployee", keyGenerator = "keyGenerator")
	public EmployeeDto getEmployee(EmployeeDto employeeDto) {
		try {
			//调用 dao 层查询用户
			employeeDto = employeeDao.getEmployeeByNameAndPwd(employeeDto);
			return employeeDto;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}


	/** 
	 * 查询员工列表
	 * 苏建华
	 * 2017年11月7日
	 */
	@Override
	@Cacheable(value = "listEmployeeByFenYe", keyGenerator = "keyGenerator")
	public List<EmployeeDto> listEmployeeByFenYe(PageUtil pageUtil) {
		//如果当前页码为 null ,则设置为1
		if(pageUtil.getCurrentPage() == null){
			pageUtil.setCurrentPage(1);
		}
		List<EmployeeDto> list = employeeDao.listEmployeeByFenYe(pageUtil);
		if(list != null && list.size() > 0){
			for(int i = 0; i < list.size(); i++){
				int count = activitiService.getHaveDealWith();
				list.get(i).setBusiness(count);
			}
		}
		return list;
	}


	/** 
	 * 添加员工
	 * 苏建华
	 * 2017年11月7日
	 */
	@Override
	@CacheEvict(value = {"getEmpRows","getEmployee","listEmployeeByFenYe"}, allEntries = true)
	public boolean insertEmployee(EmployeeDto employeeDto) {
		int flag = 0;
		try {
			if(employeeDto.getEmp_id_card() != null){
				// 截取身份证后面6位作为密码
				String pwd = employeeDto.getEmp_id_card().substring(12);
				employeeDto.setEmp_pwd(pwd);
			}
			flag = employeeDao.insertEmployee(employeeDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag > 0 ? true : false;
	}


	/** 
	 * 删除员工
	 * 苏建华
	 * 2017年11月7日
	 */
	@Override
	@CacheEvict(value = {"getEmpRows","getEmployee","listEmployeeByFenYe"}, allEntries = true)
	public boolean deleteEmployee(List<String> ids) {
		int flag = 0;
		try {
			flag = employeeDao.deleteEmployee(ids);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag > 0 ? true : false;
	}


	/** 
	 * 获取职位列表
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	@Cacheable(value = "listPosition", keyGenerator = "keyGenerator")
	public List<PositionDto> listPosition() {
		return employeeDao.listPosition();
	}


	/** 
	 * 根据 id 查询员工信息
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	public EmployeeDto getEmployeeById(Integer id) {
		return employeeDao.getEmployeeById(id);
	}


	/** 
	 * 更新员工信息
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	@CacheEvict(value = {"getEmpRows","getEmployee","listEmployeeByFenYe"}, allEntries = true)
	public boolean updateEmployee(EmployeeDto employeeDto) {
		int flag = employeeDao.updateEmployee(employeeDto);
		return flag > 0 ? true : false;
	}


	/** 
	 * 条件查询员工信息总条数
	 * 苏建华
	 * 2017年11月9日
	 */
	@Override
	@Cacheable(value = "getEmpRows", keyGenerator = "keyGenerator")
	public int getEmpRows(Query query) {
		return employeeDao.getEmpRows(query);
	}

	
	/**
	 * 根据职位获取员工姓名
	 */
	@Override
	public String getEmployeeId(String positionId) {
		return employeeDao.getEmployeeId(positionId);
	}

}
