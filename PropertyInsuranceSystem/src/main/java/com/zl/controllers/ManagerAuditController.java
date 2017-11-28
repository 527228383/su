package com.zl.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.PolicyDto;
import com.zl.service.AdminService;
import com.zl.service.MannagerService;
import com.zl.service.SalesService;
import com.zl.util.PageUtil;
import com.zl.util.Query;
/***
 * 经理业务审核
 * @author 王松
 *
 * 2017年11月9日
 */
@Controller
@Scope("prototype")
@RequestMapping("/mannager/")
public class ManagerAuditController {
	@Autowired
	private MannagerService mannagerService;
	
	@Autowired
	private SalesService salesService;
	
	@Autowired
	private AdminService adminService;
		
	/**
	 *经理查询理赔详情
	 *王松
	 * 2017年11月9日
	 */
	@RequestMapping("getPolicydetails")
	public ModelAndView getPolicydetailsById(String id,HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		ClaimDetailsDto claimDetailsDto = adminService.getClaimDetailsById(id);
		if(claimDetailsDto!=null){
			mv.addObject("claimDetailsDto", claimDetailsDto);
		}
		mv.setViewName("ws/policyClaim");
		return mv;
	}
	
	/**
	 *经理审核操作
	 *王松
	 * 2017年11月9日
	 */
	@RequestMapping("MannagerReviewClaim")
	public String MannagerReviewClaim(ClaimDetailsDto claimDetailsDto){
		if(claimDetailsDto.getB_insured_amount()<500000){
			if(claimDetailsDto.getMgr_dicision()==1){
				claimDetailsDto.setState(8);//7表示通过并赔付
			}else if(claimDetailsDto.getMgr_dicision()==0){
				claimDetailsDto.setState(9);//9表示驳回
			}
		}else{
			if(claimDetailsDto.getMgr_dicision()==1){
				claimDetailsDto.setState(7);//7表示通过
			}else if(claimDetailsDto.getMgr_dicision()==0){
				claimDetailsDto.setState(9);//9表示驳回
			}
		}
		mannagerService.MannagerReviewClaim(claimDetailsDto);
		return "redirect:/mannager/mannagerAllApply";
	}
	//时间匹配
	@InitBinder
	public void initBinder(WebDataBinder binder){
		//自定义数据匹配规则
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	/**
	 *经理分页查看所有业务员审核过的理赔申请
	 *王松
	 * 2017年11月9日
	 * @throws IOException 
	 */
	@RequestMapping(value="mannagerAllApply", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView listAllApply(String s,ModelAndView mv,PageUtil pageUtil,Query query, HttpServletRequest req){
		if(pageUtil.getCurrentPage() == null){
			pageUtil.setCurrentPage(1);
		}
		List<String> states = new ArrayList<String>();
		if("1".equals(s)){
			states.add("6");
		}
		if("2".equals(s)){
			states.add("7");
			states.add("8");
			states.add("9");
			states.add("10");
		}
		pageUtil.setRowSize(mannagerService.selectRecord(query));//改自己的方法
		query.setStates(states);
		pageUtil.setQuery(query);
		List<ClaimDetailsDto> claimDetailsDto = mannagerService.listAllClaimDetails(pageUtil);
		mv.addObject("pageUtil", pageUtil);
		if(claimDetailsDto!=null){
			mv.addObject("claimDetailsDto", claimDetailsDto);
			mv.setViewName("ws/mger_main");
		}
		return mv;
			
	}

	/**
	 * 查看保单详情
	 * @param 王松
	 * @return 
	 */
	@RequestMapping("getPolicyById")
	public ModelAndView listPolicys(String id){
		ModelAndView mv = new ModelAndView();
		PolicyDto  policyDto = salesService.getPolicyById(id);
		if(policyDto!=null){
			mv.setViewName("ws/policyDetails.jsp");
			mv.addObject("policy", policyDto);
		}
		return mv;

	}
	
	/**
	 * 查看单个业务员处理的保单
	 * 王松
	 * 2017年11月14日
	 */
	@RequestMapping("listSalesDel")
	public ModelAndView listSalesDel(String emp_id,PageUtil pageUtil,Query query){
		ModelAndView mv = new ModelAndView();
		Map<String,Object> pageMap = new HashMap<String, Object>();
		Map<String,Object> queryMap = new HashMap<String, Object>();
		if(pageUtil.getCurrentPage()==null){
			pageUtil.setCurrentPage(1);
		}
		queryMap.put("emp_id", emp_id);
		queryMap.put("query", query);
		pageUtil.setRowSize(mannagerService.salesDelcount(queryMap));
		pageMap.put("emp_id", emp_id);
		pageUtil.setQuery(query);
		pageMap.put("pageUtil", pageUtil);
		List<ClaimDetailsDto> claims = mannagerService.listSalesDel(pageMap);
		if(claims!=null){
			mv.addObject("claims", claims);
			mv.setViewName("ws/salesDel");
		}
		return mv;
	}
}
