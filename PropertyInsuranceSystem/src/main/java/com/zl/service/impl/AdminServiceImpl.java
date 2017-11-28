package com.zl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.zl.dao.AdminDao;
import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.EmployeeDto;
import com.zl.service.AdminService;
import com.zl.util.Global;
import com.zl.util.PageUtil;
import com.zl.util.Query;

/**
 * 管理员服务层实现类 (service)
 * @author 苏建华
 *
 * 2017年11月8日
 */
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	/** 
	 * 根据保单号查询理赔详情
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	//@Cacheable(value = "getClaimDetailsById", keyGenerator = "keyGenerator")
	public ClaimDetailsDto getClaimDetailsById(String id) {
		return adminDao.getClaimDetailsById(id);
	}

	/** 
	 * 管理员审核理赔
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	public boolean updateClaimDetails(ClaimDetailsDto claimDetailsDto) {
		Object obj = Global.getSessionAttribute("employee");
		if(obj == null){
			return false;
		}
		EmployeeDto employeeDto = (EmployeeDto) obj;
		claimDetailsDto.setAdmin_id(employeeDto.getId().toString());
		if(claimDetailsDto.getAdmin_dicision() == 1){
			claimDetailsDto.setState(8);
		}else if(claimDetailsDto.getAdmin_dicision() == 0){
			claimDetailsDto.setState(9);
		}
		int flag = adminDao.updateClaimDetails(claimDetailsDto);
		return flag > 0 ? true : false;
	}

	/** 
	 * 查询未审核的理赔列表
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	//@Cacheable(value = "listClaimDetailsNoDealWith", keyGenerator = "keyGenerator")
	public List<ClaimDetailsDto> listClaimDetailsNoDealWith(PageUtil pageUtil) {
		if(pageUtil.getCurrentPage() == null){
			pageUtil.setCurrentPage(1);
		}
		return adminDao.listClaimDetailsNoDealWith(pageUtil);
	}

	/** 
	 * 查询已经处理的理赔
	 * 苏建华
	 * 2017年11月9日
	 */
	@Override
	//@Cacheable(value = "listClaimDetailsHaveDealtWith", keyGenerator = "keyGenerator")
	public List<ClaimDetailsDto> listClaimDetailsHaveDealtWith(PageUtil pageUtil) {
		if(pageUtil.getCurrentPage() == null){
			pageUtil.setCurrentPage(1);
		}
		return adminDao.listClaimDetailsHaveDealtWith(pageUtil);
	}

	/** 
	 * 查询未处理的理赔总条数
	 * 苏建华
	 * 2017年11月9日
	 */
	@Override
	@Cacheable(value = "getRowsForNoDealWith", keyGenerator="keyGenerator")
	public int getRowsForNoDealWith(Query query) {
		return adminDao.getRowsForNoDealWith(query);
	}

	/** 
	 * 查询已经处理的理赔总条数
	 * 苏建华
	 * 2017年11月9日
	 */
	@Override
	//@Cacheable(value = "getRowsForHaveDealtWith", keyGenerator = "keyGenerator")
	public int getRowsForHaveDealtWith(Query query) {
		return adminDao.getRowsForHaveDealtWith(query);
	}

	/** 
	 * 查询所有理赔信息的总条数
	 * 苏建华
	 * 2017年11月9日
	 */
	@Override
	//@Cacheable(value = "getAllRows", keyGenerator = "keyGenerator")
	public int getAllRows(Query query) {
		return adminDao.getAllRows(query);
	}

	/** 
	 * 分页查询所有理赔信息
	 * 苏建华
	 * 2017年11月9日
	 */
	@Override
	//@Cacheable(value = "listAllClaimDetails", keyGenerator = "keyGenerator")
	public List<ClaimDetailsDto> listAllClaimDetails(PageUtil pageUtil) {
		if(pageUtil.getCurrentPage() == null){
			pageUtil.setCurrentPage(1);
		}
		return adminDao.listAllClaimDetails(pageUtil);
	}

}
