package com.zl.service;

import java.io.InputStream;
import java.util.List;
import java.util.zip.ZipInputStream;

import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.ProcessDefinitionDto;
import com.zl.util.PageUtil;


/**
 * 流程控制 service 接口
 *
 * @author 苏建华
 * 2017年11月13日
 */
public interface ActivitiService {
	
	/**
	 * 部署流程
	 *
	 * @author 苏建华
	 * 2017年11月13日
	 */
	public List<ProcessDefinitionDto> deployProcess(String processName ,ZipInputStream zipFile);
	
	/**
	 * 开启流程实例
	 * polId : 保单id 
	 * @author 苏建华
	 * 2017年11月13日
	 */
	public void startProcess(String polId);
	
	/**
	 * 查询流程定义列表
	 *
	 * @author 苏建华
	 * 2017年11月13日
	 */
	public List<ProcessDefinitionDto> listProcessDefinition(Integer currentPage);
	
	/**
	 * 删除流程
	 *
	 * @author 苏建华
	 * 2017年11月14日
	 */
	public void deleteProcess(List<String> deployId);
	
	/**
	 * 查询未处理的理赔列表
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	List<ClaimDetailsDto> listNoDealWith(PageUtil pageUtil);
	
	/**
	 * 查询已处理的理赔列表
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	List<ClaimDetailsDto> listHaveDealWith(PageUtil pageUtil);
	
	/**
	 * 查询所有理赔列表
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	List<ClaimDetailsDto> listAllDealWith(PageUtil pageUtil);
	
	/**
	 * 处理理赔
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	void dealWithClaimDetails(ClaimDetailsDto claimDetailsDto);
	
	
	/**
	 * 查询流程定义数量
	 *
	 * @author 苏建华
	 * 2017年11月17日
	 */
	public int getDeploymentCount();
	
	/**
	 * 模糊查询已处理的业务数
	 *
	 * @author 苏建华
	 * 2017年11月16日
	 */
	int getHaveDealWithCount(PageUtil pageUtil);
	
	/**
	 * 模糊查询未处理的业务数
	 *
	 * @author 苏建华
	 * 2017年11月16日
	 */
	int getNoDealWithCount(PageUtil pageUtil);
	
	/**
	 * 模糊查询总业务数
	 *
	 * @author 苏建华
	 * 2017年11月16日
	 */
	int getAllDealWithCount(PageUtil pageUtil);
	
	/**
	 * 已处理的业务数
	 *
	 * @author 苏建华
	 * 2017年11月17日
	 */
	int getHaveDealWith();
	
	/**
	 * 获取流程图
	 *
	 * @author 苏建华
	 * 2017年11月17日
	 */
	InputStream getProcessDefinitionPng(String deploymentId);
}
