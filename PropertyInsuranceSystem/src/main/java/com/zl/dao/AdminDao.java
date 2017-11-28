package com.zl.dao;

import java.util.List;

import com.zl.dto.ClaimDetailsDto;
import com.zl.util.PageUtil;
import com.zl.util.Query;

/**
 * 管理员持久层(dao)
 * @author 苏建华
 *
 * 2017年11月8日
 */
public interface AdminDao {
	
	/**
	 * 查询未审核的理赔列表
	 * 苏建华
	 * 2017年11月8日
	 */
	List<ClaimDetailsDto> listClaimDetailsNoDealWith(PageUtil pageUtil);
	
	/**
	 * 根据保单号查询理赔详情
	 * 苏建华
	 * 2017年11月8日
	 */
	ClaimDetailsDto getClaimDetailsById(String id);
	
	/**
	 * 管理员审核理赔
	 * 苏建华
	 * 2017年11月8日
	 */
	int updateClaimDetails(ClaimDetailsDto claimDetailsDto);
	
	/**
	 * 查询已经处理的理赔
	 * 苏建华
	 * 2017年11月9日
	 */
	List<ClaimDetailsDto> listClaimDetailsHaveDealtWith(PageUtil pageUtil);
	
	/**
	 * 查询未处理的理赔总条数
	 * 苏建华
	 * 2017年11月9日
	 */
	int getRowsForNoDealWith(Query query);
	
	/**
	 * 查询已经处理的理赔总条数
	 * 苏建华
	 * 2017年11月9日
	 */
	int getRowsForHaveDealtWith(Query query);
	
	/**
	 * 查询所有理赔信息
	 * 苏建华
	 * 2017年11月9日
	 */
	List<ClaimDetailsDto> listAllClaimDetails(PageUtil pageUtil);
	
	/**
	 * 查询所有理赔的总条数
	 * 苏建华
	 * 2017年11月9日
	 */
	int getAllRows(Query query);
	
}
