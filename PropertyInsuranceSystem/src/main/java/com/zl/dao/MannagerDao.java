package com.zl.dao;

import java.util.List;
import java.util.Map;

import com.zl.dto.ClaimDetailsDto;
import com.zl.util.PageUtil;
import com.zl.util.Query;

/***
 * 经理查看理赔DAO层
 * @author 王松
 *
 * 2017年11月9日
 */
public interface MannagerDao {
	/**
	 *根据ID查看理赔详情
	 *王松
	 * 2017年11月9日
	 */
	ClaimDetailsDto getPolicydetailsById(String id);
	
	
	/**
	 *经理处理理赔
	 *王松
	 * 2017年11月9日
	 */
	int MannagerReviewClaim(ClaimDetailsDto claimDetailsDto);
	
	/**
	 *经理查看所有业务员审核过的理赔申请
	 *王松
	 * 2017年11月9日
	 */
	List<ClaimDetailsDto> listAllClaimDetails(PageUtil pageUtil);
	
	/**
	 *查看所有申请理赔记录数
	 *王松
	 * 2017年11月9日
	 */
	Integer selectRecord(Query query);
	
	/**
	 * 经理查看某个业务员所有处理的理赔
	 * 2017年11月14日
	 */
	List<ClaimDetailsDto>listSalesDel(Map<String,Object> map);
	
	/**
	 * 经理查看某个业务员所有处理的理赔记录数
	 * 2017年11月14日
	 */
	Integer salesDelcount(Map<String,Object> map);
	 
	
	
	
	
	
	
	
	
	
	
}
