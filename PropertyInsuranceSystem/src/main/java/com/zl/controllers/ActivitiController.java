package com.zl.controllers;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.zip.ZipInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.ProcessDefinitionDto;
import com.zl.service.ActivitiService;
import com.zl.util.Global;
import com.zl.util.PageUtil;
import com.zl.util.Query;
import com.zl.util.ReturnPage;

/**
 * 业务流程控制
 *
 * @author 苏建华
 * 2017年11月13日
 */
@Controller
@Scope("prototype")
@RequestMapping("/act/")
@Slf4j
public class ActivitiController {
	
	@Autowired
	ActivitiService activitiService;
	
	@InitBinder
    protected void init(HttpServletRequest request, ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }
	
	/**
	 * 跳转流程页面,并查出流程定义列表
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	@RequestMapping("toActivitiJsp")
	public String toActivitiJsp(Integer currentPage){
		List<ProcessDefinitionDto> deployProcess = activitiService.listProcessDefinition(currentPage);
		Global.setRequestAttribute("deployProcess", deployProcess);
		return "sjh/activiti";
	}
	
	/**
	 * 分页查询流程定义列表
	 *
	 * @author 苏建华
	 * 2017年11月16日
	 */
	@RequestMapping("listProcessDefinitionDto/{currentPage}")
	public String listProcessDefinitionDto(@PathVariable("currentPage") Integer currentPage){
		List<ProcessDefinitionDto> deployProcess = activitiService.listProcessDefinition(currentPage);
		Global.setRequestAttribute("deployProcess", deployProcess);
		return "sjh/activiti";
	}
	
	
	/**
	 * 部署流程
	 *
	 * @author 苏建华
	 * 2017年11月13日
	 */
	@RequestMapping("deployProcess")
	public String deployProcess(String processName,@RequestParam MultipartFile zipFile){
		ZipInputStream zis = null;
		try {
			zis = new ZipInputStream(zipFile.getInputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<ProcessDefinitionDto> deployProcess = activitiService.deployProcess(processName, zis);
		Global.setRequestAttribute("deployProcess", deployProcess);
		return "sjh/activiti";
	}
	
	/**
	 * 开启流程定义
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	@RequestMapping("start/{polId}")
	public String startProcess(@PathVariable("polId") String polId){
	    String url = Global.getRequest().getHeader("Referer");
		activitiService.startProcess(polId);
		return "redirect:" + url;
	}
	
	/**
	 * 删除流程定义
	 *
	 * @author 苏建华
	 * 2017年11月14日
	 */
	@RequestMapping("deleteProcess")
	public String deleteProcess(String[] deployId){
		activitiService.deleteProcess(Arrays.asList(deployId));
		return "redirect:/act/toActivitiJsp";
	}
	
	/**
	 * 查询未处理的理赔列表
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	@RequestMapping("getNoDealWithClaimDetails")
	public String getNoDealWithClaimDetails(PageUtil pageUtil, Query query, BindingResult bindingResult){
		pageUtil.setQuery(query);
		List<ClaimDetailsDto> list = activitiService.listNoDealWith(pageUtil);
		Global.setRequestAttribute("list", list);
		return ReturnPage.getNoDealWithReturnPage();
	}
	
	/**
	 * 查询已处理的理赔列表
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	@RequestMapping("getHaveDealWithClaimDetails")
	public String getHaveDealWithClaimDetails(PageUtil pageUtil, Query query, BindingResult bindingResult){
		pageUtil.setQuery(query);
		List<ClaimDetailsDto> list = activitiService.listHaveDealWith(pageUtil);
		Global.setRequestAttribute("list", list);
		return ReturnPage.getHaveDealWithReturnPage();
	}
	
	/**
	 * 查询所有的理赔列表
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	@RequestMapping("getAllDealWithClaimDetails")
	public String getAllDealWithClaimDetails(PageUtil pageUtil, Query query, BindingResult bindingResult){
		pageUtil.setQuery(query);
		List<ClaimDetailsDto> list = activitiService.listAllDealWith(pageUtil);
		Global.setRequestAttribute("list", list);
		return ReturnPage.getAllDealWithReturnPage();
	}
	
	/**
	 * 处理理赔
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	@RequestMapping("dealWithClaimDetails")
	public String dealWithClaimDetails(ClaimDetailsDto claimDetailsDto, @RequestParam("pics") MultipartFile[] pics){
		String path=Global.getHttpSession().getServletContext().getRealPath("/");//获取绝对路径
		path=path+"upload/";//图片保存到项目下pic目录
		List<String> picList =new ArrayList<String>();
		for(int i=0;i<pics.length;i++){
			if(!pics[i].isEmpty()){
				String picName=pics[i].getOriginalFilename();//获取原始文件名
				String newFileName=UUID.randomUUID().toString()+picName.substring(picName.lastIndexOf("."));//产生随机名
				File newFile=new File(path+newFileName);//建立新文件,并命名
				try {
					pics[i].transferTo(newFile);//复制文件
				} catch (Exception e) {
					e.printStackTrace();
				}
				picList.add(newFileName);//新文件名放进集合
			}
		}
		claimDetailsDto.setPicList(picList);//设置多图
		activitiService.dealWithClaimDetails(claimDetailsDto);
		return "redirect:/act/getNoDealWithClaimDetails";
	}
	
	/**
	 * 查看流程图
	 * @return
	 */
	@RequestMapping("viewProcessDefinition/{deploymentId}")
	public String viewProcessDefinition(
			@PathVariable(value = "deploymentId") String deploymentId, HttpServletResponse response) {
		//获取部署流程图资源
		InputStream in = activitiService.getProcessDefinitionPng(deploymentId);
		OutputStream out = null;
		try {
			out = response.getOutputStream();
			byte[] b = new byte[1024];
			 for (int len = -1; (len= in.read(b))!=-1; ) {
	                out.write(b, 0, len);
	         }
		} catch (IOException e) {
			log.error("获取部署流程图失败, 错误信息为: {}", e.getMessage());
		} finally {
			if(out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
}
