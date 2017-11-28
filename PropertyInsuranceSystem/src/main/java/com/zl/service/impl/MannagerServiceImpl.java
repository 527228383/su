package com.zl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.dao.MannagerDao;
import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.EmployeeDto;
import com.zl.service.MannagerService;
import com.zl.util.Global;
import com.zl.util.PageUtil;
import com.zl.util.Query;
/***
 * 经理处理赔付Service实现层
 * @author 王松
 *
 * 2017年11月9日
 */
@Service
public class MannagerServiceImpl implements MannagerService {
	@Autowired
	private MannagerDao mannagerDao;
	@Override
	/**
	 * 根据ID查看赔理赔详情
     *@author 王松
     * 2017年11月9日
	 */
	public ClaimDetailsDto getPolicydetailsById(String id) {
		ClaimDetailsDto claimDetailsDto = mannagerDao.getPolicydetailsById(id);
		return claimDetailsDto;
	}
	
	/**
	 * 审核理赔
	 * @author 王松
	 * 2017年11月9日
	 */
	@Override
	public Map<String, Object> MannagerReviewClaim(ClaimDetailsDto claimDetailsDto) {
		Object obj = Global.getSessionAttribute("employee");
		if(obj == null){
			return null;
		}
		EmployeeDto employeeDto = (EmployeeDto) obj;
		if(claimDetailsDto.getMgr_dicision()==1){
			claimDetailsDto.setState(7);//7表示通过
		}else if(claimDetailsDto.getMgr_dicision()==0){
			claimDetailsDto.setState(9);//9表示驳回
		}
		claimDetailsDto.setMgr_id(employeeDto.getId().toString());
		mannagerDao.MannagerReviewClaim(claimDetailsDto);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", claimDetailsDto.getMgr_dicision());
		map.put("money", claimDetailsDto.getB_insured_amount());
		return map;
	}

	
	/**
	 *经理查看所有业务员审核过的理赔申请
	 *王松
	 * 2017年11月9日
	 */
	@Override
	public List<ClaimDetailsDto> listAllClaimDetails(PageUtil pageUtil) {
		List<ClaimDetailsDto> list =mannagerDao.listAllClaimDetails(pageUtil);
		return list;
	}
	/**
	 *经理查看所有业务员审核过的记录数
	 *王松
	 * 2017年11月9日
	 */
	@Override
	public Integer selectRecord(Query query) {
		Integer rows = mannagerDao.selectRecord(query);
		return rows;
	}
	
	
	/**
	 *根据员工ID查看该员工处理的理赔数
	 *王松
	 * 2017年11月9日
	 */
	@Override
	public List<ClaimDetailsDto> listSalesDel(Map<String,Object> map) {
		List<ClaimDetailsDto> claims = mannagerDao.listSalesDel(map);
		if(claims!=null&&claims.size()>0){
			return claims;
		}else{
			return null;
		}
	}
	 
	/**
	 *经理查看该业务员审核过的记录数
	 *王松
	 * 2017年11月18日
	 */
	@Override
	public Integer salesDelcount(Map<String,Object> map) {
		Integer rows = mannagerDao.salesDelcount(map);
		return rows;
	}
	
	


	
	
	

	
	
	
	
	
}
