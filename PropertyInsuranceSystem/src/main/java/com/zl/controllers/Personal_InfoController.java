package com.zl.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zl.dto.InsureDto;
import com.zl.dto.ProvinceDto;
import com.zl.service.AreaService;
import com.zl.service.Personal_InfoService;

@Controller
@RequestMapping("/insuredata/")
public class Personal_InfoController {
	@Autowired
	private AreaService areaService;
	@Autowired
	private Personal_InfoService personal_InfoService;
	/**
	 * 查看个人资料
	 * 苏明翔
	 * 2017年11月9日
	 */
	
	@RequestMapping("/personal_Info")

	public ModelAndView personal_Info(String ins_tel,ModelAndView mv,HttpServletRequest req){
		InsureDto id= (InsureDto)req.getSession().getAttribute("insure");
		InsureDto insureDto=personal_InfoService.getInsure(id.getIns_tel());
		List<ProvinceDto> province = areaService.listProvince();
		mv.addObject("province", province);
		mv.addObject("insureDto", insureDto);
		mv.setViewName("Client/personal_Info");
		return mv;
	}

	/**
	 * 修改个人资料
	 * 苏明翔
	 * 2017年11月9日
	 */
	@RequestMapping("/updatePersonalInfo")
	public String updatePersonalInfo(InsureDto insureDto){
		boolean flg=personal_InfoService.updateInsure(insureDto);
		 if(flg){
			 return "redirect:/insure/showfirst";
		 }
		 return "Client/personal_Info";
	}
	

	
}
