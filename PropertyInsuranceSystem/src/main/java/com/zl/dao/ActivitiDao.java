package com.zl.dao;

import java.util.List;
import java.util.Map;

import com.zl.dto.ClaimDetailsDto;

/**
 * 流程控制 持久层
 *
 * @author 苏建华
 * 2017年11月13日
 */
public interface ActivitiDao {
	
	/**
	 * 根据流程实例 id 查询理赔详情
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	List<ClaimDetailsDto> listClaimDetailsDtoByProcessId(Map<String, Object> args);
	
	/**
	 * 模糊查询业务数量
	 *
	 * @author 苏建华
	 * 2017年11月17日
	 */
	int getClaimDetailsCount(Map<String, Object> args);
	
	/**
	 * 更新理赔结果
	 *
	 * @author 苏建华
	 * 2017年11月18日
	 */
	int updateClaimDetailsResult(Map<String, Object> args);
}
