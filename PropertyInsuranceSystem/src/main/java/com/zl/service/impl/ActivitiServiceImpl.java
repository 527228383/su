package com.zl.service.impl;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import org.activiti.engine.HistoryService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.dao.ActivitiDao;
import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.EmployeeDto;
import com.zl.dto.InsureDto;
import com.zl.dto.PolicyDto;
import com.zl.dto.ProcessDefinitionDto;
import com.zl.service.ActivitiService;
import com.zl.service.AdminService;
import com.zl.service.InsureService;
import com.zl.service.MannagerService;
import com.zl.service.SalesService;
import com.zl.util.Global;
import com.zl.util.PageUtil;

/**
 * 流程控制 service 实现类
 *
 * @author 苏建华
 * 2017年11月13日
 */
@Service

public class ActivitiServiceImpl implements ActivitiService {
	
	@Autowired
	RepositoryService repositoryService;
	
	@Autowired
	RuntimeService runtimeService;
	
	@Autowired
	TaskService taskService;
	
	@Autowired
	HistoryService historyService;
	
	@Autowired
	ActivitiDao activitiDao;
	
	@Autowired
	InsureService insureService;
	
	@Autowired
	SalesService salesService;
	
	@Autowired
	MannagerService mannagerService;
	
	@Autowired
	AdminService adminService;
	/**
	 * 部署流程
	 */
	@Override
	public List<ProcessDefinitionDto> deployProcess(String processName, ZipInputStream zipFile) {
		repositoryService.createDeployment()
					.name(processName)
					.addZipInputStream(zipFile)
					.deploy();
		return listProcessDefinition(1);
	}

	/**
	 * 开启流程实例
	 */
	@Override
	public void startProcess(String polId) {
		Object obj = Global.getSessionAttribute("insure");
		if(obj == null){
			return;
		}
		InsureDto insureDto = (InsureDto) obj;
		ClaimDetailsDto claimDetailsDto = new ClaimDetailsDto();
		claimDetailsDto.setPol_id(polId);
		PolicyDto policy = salesService.getPolicyById(polId);
		claimDetailsDto.setInsureDto(insureDto);
		claimDetailsDto.setAssurerDto(policy.getAssurerDto());
		insureService.insertClaimDetails(claimDetailsDto);
		String key = ClaimDetailsDto.class.getSimpleName();
		String objId = key + "." + claimDetailsDto.getId();
		ProcessInstance pi = runtimeService
								.startProcessInstanceByKey(key, objId);
		claimDetailsDto.setProcessId(pi.getId());
		insureService.updateProcessId(claimDetailsDto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("stateid",5);
		map.put("id",polId);
		insureService.update_policy(map);
	}

	/**
	 * 查询流程定义列表
	 */
	@Override
	public List<ProcessDefinitionDto> listProcessDefinition(Integer currentPage) {
		if(currentPage == null){
			currentPage = 1;
		}
		int maxRows = 6;
		int start = (currentPage - 1) * maxRows;
		List<Deployment> deployment = repositoryService.createDeploymentQuery()
							.orderByDeploymenTime()
							.desc()
							.orderByDeploymentName()
							.desc()
							.listPage(start, maxRows);
		List<ProcessDefinitionDto> pdList = new ArrayList<ProcessDefinitionDto>();
		if(deployment != null && deployment.size() > 0){
			for(int i = 0; i < deployment.size(); i++){
				ProcessDefinition Definition = repositoryService.createProcessDefinitionQuery()
							.deploymentId(deployment.get(i).getId())
							.singleResult();
				ProcessDefinitionDto p = ProcessDefinitionDto.builder()
											.id(deployment.get(i).getId())
											.name(deployment.get(i).getName())
											.version(Definition.getVersion())
											.key(Definition.getKey())
											.time(deployment.get(i).getDeploymentTime())
											.build();
				pdList.add(p);
			}
		}
		PageUtil pageUtil = new PageUtil();
		pageUtil.setRowSize(getDeploymentCount());
		pageUtil.setCurrentPage(currentPage);
		Global.setRequestAttribute("pageUtil", pageUtil);
		return pdList;
	}
	
	
	

	/**
	 * 删除流程
	 */
	@Override
	public void deleteProcess(List<String> deployId) {
		if(deployId != null && deployId.size() > 0){
			for(int i = 0; i < deployId.size(); i++){
				// 不带级联的删除 , 只能删除未启动的流程定义, 如果流程已经启动,则会抛出异常
				//repositoryService.deleteDeployment(deploy_id.get(i));
				
				// 级联删除 , 可以删除已经启动的流程定义
				repositoryService.deleteDeployment(deployId.get(i), true);
			}
		}
	}
	
	/**
	 * 查询未处理的理赔列表
	 */
	@Override
	public List<ClaimDetailsDto> listNoDealWith(PageUtil pageUtil) {
		Map<String, Object> args = new HashMap<String, Object>();
		List<String> processIdList = new ArrayList<String>();
		Object obj = Global.getSessionAttribute("employee");
		if(obj == null){
			return null;
		}
		if(pageUtil.getCurrentPage() == null){
			pageUtil.setCurrentPage(1);
		}
		EmployeeDto employeeDto = (EmployeeDto) obj;
		List<Task> list = taskService.createTaskQuery()
					.taskAssignee(employeeDto.getId().toString())
					.orderByTaskCreateTime()
					.desc()
					.list();
		pageUtil.setRowSize(getNoDealWithCount(pageUtil));
		Global.setRequestAttribute("pageUtil", pageUtil);
		if(list != null && list.size() > 0){
			for(int i = 0; i < list.size(); i++){
				String processInstanceId = list.get(i).getProcessInstanceId();
				processIdList.add(processInstanceId);
			}
			args.put("pageUtil", pageUtil);
			args.put("processIdList", processIdList);
			return activitiDao.listClaimDetailsDtoByProcessId(args);
		}
		return null;
	}
	
	/**
	 * 查询已处理列表
	 */
	@Override
	public List<ClaimDetailsDto> listHaveDealWith(PageUtil pageUtil) {
		Map<String, Object> args = new HashMap<String, Object>();
		Object obj = Global.getSessionAttribute("employee");
		if(obj == null){
			return null;
		}
		EmployeeDto employeeDto = (EmployeeDto) obj;
		if(pageUtil.getCurrentPage() == null){
			pageUtil.setCurrentPage(1);;
		}
		List<HistoricTaskInstance> list = historyService
									.createHistoricTaskInstanceQuery()
									.taskAssignee(employeeDto.getId().toString())
									.finished()
									.orderByTaskCreateTime()
									.asc()
									.list();
		List<String> processIdList = new ArrayList<String>();
		pageUtil.setRowSize(getHaveDealWithCount(pageUtil));
		Global.setRequestAttribute("pageUtil", pageUtil);
		if(list != null && list.size() > 0){
			for(int i = 0; i < list.size(); i++){
				String processInstanceId = list.get(i).getProcessInstanceId();
				processIdList.add(processInstanceId);
			}
			args.put("pageUtil", pageUtil);
			args.put("processIdList", processIdList);
			return activitiDao.listClaimDetailsDtoByProcessId(args);
		}
		return null;
	}

	/**
	 * 查询所有列表
	 */
	@Override
	public List<ClaimDetailsDto> listAllDealWith(PageUtil pageUtil) {
		Map<String, Object> args = new HashMap<String, Object>();
		Object obj = Global.getSessionAttribute("employee");
		if(obj == null){
			return null;
		}
		EmployeeDto employeeDto = (EmployeeDto) obj;
		if(pageUtil.getCurrentPage() == null){
			pageUtil.setCurrentPage(1);;
		}
		pageUtil.setRowSize(getAllDealWithCount(pageUtil));
		Global.setRequestAttribute("pageUtil", pageUtil);
		List<HistoricTaskInstance> list = historyService
									.createHistoricTaskInstanceQuery()
									.taskAssignee(employeeDto.getId().toString())
									.orderByTaskCreateTime()
									.asc()
									.list();
		List<String> processIdList = new ArrayList<String>();
		args.put("pageUtil", pageUtil);
		if(list != null && list.size() > 0){
			for(int i = 0; i < list.size(); i++){
				String processInstanceId = list.get(i).getProcessInstanceId();
				processIdList.add(processInstanceId);
			}
			
			args.put("processIdList", processIdList);
			Global.setRequestAttribute("pageUtil", pageUtil);
			return activitiDao.listClaimDetailsDtoByProcessId(args);
		}
		return null;
	}
	
	/**
	 * 处理理赔
	 */
	@Override
	public void dealWithClaimDetails(ClaimDetailsDto claimDetailsDto) {
		Object obj = Global.getSessionAttribute("employee");
		if(obj == null){
			return;
		}
		EmployeeDto employeeDto = (EmployeeDto) obj;
		Map<String, Object> variables = new HashMap<String, Object>();
		Task task = taskService.createTaskQuery()
					.taskAssignee(employeeDto.getId().toString())
					.processInstanceId(claimDetailsDto.getProcessId())
					.singleResult();
		if(task != null){
			Map<String, Object> args = new HashMap<String, Object>();
			if("业务员".equals(employeeDto.getPosition_name())){
				variables = salesService.dealWithClaimDetails(claimDetailsDto);
			}else if("经理".equals(employeeDto.getPosition_name())){
				variables = mannagerService.MannagerReviewClaim(claimDetailsDto);			
				args.put("pol_id", claimDetailsDto.getPol_id());
				//不同意赔付
				if(claimDetailsDto.getMgr_dicision() == 0){
					args.put("state", 9);
					activitiDao.updateClaimDetailsResult(args);
				//同意赔付,并且赔付金额小于10万,不用经过管理员
				}else if(claimDetailsDto.getMgr_dicision() == 1 && claimDetailsDto.getB_insured_amount() <= 500000){
					args.put("state", 8);
					activitiDao.updateClaimDetailsResult(args);
				}
			}else if("超级管理员".equals(employeeDto.getPosition_name())){
				adminService.updateClaimDetails(claimDetailsDto);
				args.put("pol_id", claimDetailsDto.getPol_id());
				//同意赔付,更新保单状态
				if(claimDetailsDto.getAdmin_dicision() == 1){
					args.put("state", 8);
					activitiDao.updateClaimDetailsResult(args);
				//不同意赔付
				}else if(claimDetailsDto.getAdmin_dicision() == 0){
					args.put("state", 9);
					activitiDao.updateClaimDetailsResult(args);
				}
			}
		}
		taskService.complete(task.getId(), variables);
	}

	
	
	/**
	 * 查询流程定义条数
	 */
	@Override
	public int getDeploymentCount() {
		return (int)repositoryService.createDeploymentQuery().count();
	}

	/**
	 * 查询未处理业务数
	 */
	@Override
	public int getNoDealWithCount(PageUtil pageUtil) {
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("pageUtil", pageUtil);
		int count = 0;
		EmployeeDto employeeDto = (EmployeeDto)Global.getSessionAttribute("employee");
		List<Task> list = taskService.createTaskQuery()
							.taskAssignee(employeeDto.getId().toString())
							.list();
		if(list != null && list.size() > 0){
			List<String> claimDetailsId = new ArrayList<String>();
			for(Task task:list){
				String processInstanceId = task.getProcessInstanceId();
				ProcessInstance pi = runtimeService.createProcessInstanceQuery()
							.processInstanceId(processInstanceId)
							.singleResult();
				String businessKey = pi.getBusinessKey();
				String[] split = businessKey.split("\\.");
				claimDetailsId.add(split[1]);
			}
			args.put("pageUtil", pageUtil);
			args.put("claimDetailsId", claimDetailsId);
			count = activitiDao.getClaimDetailsCount(args);
		}
		return count;
	}

	/**
	 * 查询已处理的业务数
	 */
	@Override
	public int getHaveDealWithCount(PageUtil pageUtil) {
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("pageUtil", pageUtil);
		int count = 0;
		EmployeeDto employeeDto = (EmployeeDto)Global.getSessionAttribute("employee");
		List<HistoricTaskInstance> list = historyService.createHistoricTaskInstanceQuery()
							.taskAssignee(employeeDto.getId().toString())
							.finished()
							.list();
		if(list != null && list.size() > 0){
			List<String> claimDetailsId = new ArrayList<String>();
			for(HistoricTaskInstance task:list){
				String processInstanceId = task.getProcessInstanceId();
				HistoricProcessInstance pi = historyService.createHistoricProcessInstanceQuery()
											.processInstanceId(processInstanceId)
											.singleResult();
				String businessKey = pi.getBusinessKey();
				String[] split = businessKey.split("\\.");
				claimDetailsId.add(split[1]);
			}
			args.put("claimDetailsId", claimDetailsId);
			count = activitiDao.getClaimDetailsCount(args);
		}
		return count;
	}
	
	/**
	 * 查询总业务数
	 */
	@Override
	public int getAllDealWithCount(PageUtil pageUtil) {
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("pageUtil", pageUtil);
		int count = 0;
		EmployeeDto employeeDto = (EmployeeDto)Global.getSessionAttribute("employee");
		List<HistoricTaskInstance> list = historyService.createHistoricTaskInstanceQuery()
											.taskAssignee(employeeDto.getId().toString())
											.list();
		if(list != null && list.size() > 0){
			List<String> claimDetailsId = new ArrayList<String>();
			for(HistoricTaskInstance task:list){
				String processInstanceId = task.getProcessInstanceId();
				HistoricProcessInstance pi = historyService.createHistoricProcessInstanceQuery()
											.processInstanceId(processInstanceId)
											.singleResult();
				String businessKey = pi.getBusinessKey();
				String[] split = businessKey.split("\\.");
				claimDetailsId.add(split[1]);
			}
			args.put("claimDetailsId", claimDetailsId);
			count = activitiDao.getClaimDetailsCount(args);
		}
		return count;
	}

	/**
	 * 查询已处理业务数
	 */
	@Override
	public int getHaveDealWith() {
		Object obj = Global.getSessionAttribute("employee");
		if(obj == null){
			return 0;
		}
		EmployeeDto employeeDto = (EmployeeDto) obj;
		long count = historyService.createHistoricTaskInstanceQuery()
						.taskAssignee(employeeDto.getId().toString())
						.finished()
						.count();
		return count == 0 ? 0 : (int)count;
	}

	/**
	 * 获取流程图
	 */
	@Override
	public InputStream getProcessDefinitionPng(String deploymentId) {
		List<String> list = repositoryService
						.getDeploymentResourceNames(deploymentId);
		String deploymentName = "";
		if(list!=null && list.size()>0){
            for(String name:list){
                if(name.indexOf(".png")>=0){
                	deploymentName = name;
                }
            }
        }
		InputStream is = repositoryService.getResourceAsStream(deploymentId, deploymentName);
		return is;
	}

}
