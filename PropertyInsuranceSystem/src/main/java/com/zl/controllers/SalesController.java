package com.zl.controllers;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.zl.dto.CheckDetailDto;
import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.EmployeeDto;
import com.zl.dto.OrderDto;
import com.zl.dto.PolicyDto;
import com.zl.service.SalesService;
import com.zl.util.PageUtil;
import com.zl.util.Query;
/**
 * @desc 业务员控制层
 * @author 陈利
 * @date 2017年11月8日
 */
@Controller
@Scope("prototype")
@RequestMapping("/sales")
public class SalesController {
	@Autowired
	private SalesService salesService;
	@InitBinder
	public void initBinder(WebDataBinder binder){
		//自定义数据匹配规则
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	/**
	 * @desc 业务员登录后,首页显示各状态的订/保单待处理数量
	 * @author 陈利
	 * @date 2017年11月9日
	 */
	@RequestMapping("/")
	public String countOrdersAndPolicysByState(Query query,HttpServletRequest req){
		Map<String,Integer> countMap=new HashMap<String,Integer>();
		query.setStart_state_id(1);
		query.setEnd_state_id(1);
		countMap.put("order1", salesService.countOrdersByState(query));//1.待支付
		query.setStart_state_id(2);
		query.setEnd_state_id(2);
		countMap.put("order2", salesService.countOrdersByState(query));//2.待核实
		query.setStart_state_id(3);
		query.setEnd_state_id(3);
		countMap.put("policy3", salesService.countPolicysByState(query));//3.生效中
		query.setStart_state_id(4);
		query.setEnd_state_id(4);
		countMap.put("policy4", salesService.countPolicysByState(query));//4.待续保
		query.setStart_state_id(5);
		query.setEnd_state_id(5);
		countMap.put("policy5", salesService.countPolicysByState(query));//5.待审核
		query.setStart_state_id(6);
		query.setEnd_state_id(7);
		countMap.put("policy6", salesService.countPolicysByState(query));//6.业务员审核通过
//		query.setStart_state_id(7);
//		query.setEnd_state_id(7);
//		countMap.put("policy7", salesService.countPolicysByState(query));//7.经理审核通过
		query.setStart_state_id(8);
		query.setEnd_state_id(8);
		countMap.put("policy8", salesService.countPolicysByState(query));//8.已赔付
		query.setStart_state_id(9);
		query.setEnd_state_id(9);
		countMap.put("policy9", salesService.countPolicysByState(query));//9.已驳回
		query.setStart_state_id(10);
		query.setEnd_state_id(10);
		countMap.put("policy10", salesService.countOrdersByState(query));//10.核保未通过
		req.setAttribute("countMap", countMap);
		return "cl/main";
	}
	/**
	 * @desc 查看全部订单/待支付订单/待核实订单列表
	 * @author 陈利
	 * @date 2017年11月10日
	 */
	@RequestMapping("/listOrders/{operate}")
	public ModelAndView listOrders(ModelAndView mv,PageUtil pageUtil,Query query,@PathVariable("operate") String operate){
		if(pageUtil.getCurrentPage()==null||"".equals(pageUtil.getCurrentPage())){
			pageUtil.setCurrentPage(1);
		}
		pageUtil.setPageSize(6);//每页数据条数
		if("all".equals(operate)){//所有订单
			query.setStart_state_id(1);//1.待支付
			query.setEnd_state_id(2);//2.待核实
		}else if("1".equals(operate)){
			query.setStart_state_id(1);//1.待支付
			query.setEnd_state_id(1);
		}else if("2".equals(operate)){
			query.setStart_state_id(2);//2.待核实
			query.setEnd_state_id(2);
		}else if("10".equals(operate)){//10.核保未通过
			query.setStart_state_id(10);
			query.setEnd_state_id(10);
		}
		pageUtil.setQuery(query);
		pageUtil.setRowSize(salesService.countOrdersByState(query));
		List<OrderDto> listOrders=salesService.listOrders(pageUtil);
		mv.setViewName("cl/order");
		mv.addObject("listOrders", listOrders);
		mv.addObject("operate", operate);
		return mv;
	}
	/**
	 * @desc 查询订单详情/待核实订单详情
	 * @author 陈利
	 * @date 2017年11月8日
	 */
	@RequestMapping("/getOrder/{operate}/{id}")
	public ModelAndView getOrderById(ModelAndView mv,@PathVariable("operate") String operate,@PathVariable("id") String id,HttpServletRequest req){
		OrderDto orderDto=salesService.getOrderById(id);
		if(orderDto!=null){
			if("view".equals(operate)){//to查看订单页
				mv.setViewName("cl/orderDetail");
			}else if("check".equals(operate)){//to核保页
				mv.setViewName("cl/orderUncheckedDetail");
			}
			mv.addObject("orderDto", orderDto);
			req.getSession().setAttribute("orderDto", orderDto);
		}
		return mv;
	}
	/**
	 * @desc 处理待核实订单
	 * @author 陈利
	 * @date 2017年11月12日
	 */
	@RequestMapping("/checkOrder")
	public String checkOrder(CheckDetailDto checkDetailDto,@RequestParam("pics") MultipartFile[] pics,HttpServletRequest req){
		String path=req.getSession().getServletContext().getRealPath("/");//获取绝对路径
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
		checkDetailDto.setPicList(picList);//设置多图
		OrderDto orderDto=(OrderDto) req.getSession().getAttribute("orderDto");
		salesService.checkOrder(orderDto,checkDetailDto);
		return "redirect:/sales/listOrders/2";
	}
	/**
	 * @desc 查看订单核实详情
	 * @author 陈利
	 * @date 2017年11月11日
	 */
	@RequestMapping("/getCheckDetail/{id}")
	public ModelAndView getCheckDetailDto(@PathVariable("id")String id,ModelAndView mv,HttpServletRequest req){ 
		OrderDto orderDto=salesService.getOrderById(id);
		CheckDetailDto checkDetailDto=salesService.getCheckDetailDto(id);
		if(orderDto!=null&&checkDetailDto!=null){
			mv.setViewName("cl/orderChecked");
			mv.addObject("orderDto", orderDto);
			mv.addObject("checkDetailDto", checkDetailDto);
		}
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	/**
	 * @desc 查看待处理保单/生效中/待续保/待审核/审核中/已驳回/已赔付列表
	 * @author 陈利
	 * @date 2017年11月10日
	 */
	@RequestMapping("/listPolicys/{operate}")
	public ModelAndView unpaidOrders(ModelAndView mv,PageUtil pageUtil,Query query,@PathVariable("operate") String operate){
		if(pageUtil.getCurrentPage()==null||"".equals(pageUtil.getCurrentPage())){
			pageUtil.setCurrentPage(1);
		}
		pageUtil.setPageSize(6);//每页数据条数
		if("all".equals(operate)){//待处理
			query.setStart_state_id(4);//4.待续保
			query.setEnd_state_id(5);//5.待审核
		}else if("3".equals(operate)){//3.生效中
			query.setStart_state_id(3);
			query.setEnd_state_id(3);
		}else if("4".equals(operate)){//4.待续保
			query.setStart_state_id(4);
			query.setEnd_state_id(4);
		}else if("5".equals(operate)){//5.待审核
			query.setStart_state_id(5);
			query.setEnd_state_id(5);
		}else if("my".equals(operate)){//已处理
			query.setStart_state_id(6);//6.审核中
			query.setEnd_state_id(9);//9.已赔付
		}else if("6".equals(operate)){//审核中(6.业务员/7.经理)
			query.setStart_state_id(6);
			query.setEnd_state_id(7);
		}else if("8".equals(operate)){//8.已赔付
			query.setStart_state_id(8);
			query.setEnd_state_id(8);
		}else if("9".equals(operate)){//9.已驳回
			query.setStart_state_id(9);
			query.setEnd_state_id(9);
		}
		pageUtil.setQuery(query);
		pageUtil.setRowSize(salesService.countPolicysByState(query));
		List<PolicyDto> listPolicys=salesService.listPolicys(pageUtil);
		mv.setViewName("cl/policy");
		mv.addObject("listPolicys", listPolicys);
		mv.addObject("operate", operate);
		return mv;
	}
	/**
	 * @desc 查询保单详情
	 * @author 陈利
	 * @date 2017年11月8日
	 */
	@RequestMapping("/getPolicy/{operate}/{id}")
	public ModelAndView getPolicyById(ModelAndView mv,@PathVariable("operate") String operate,@PathVariable("id") String id,HttpServletRequest req){
		PolicyDto policyDto=salesService.getPolicyById(id);
		if(policyDto!=null){
			if("view".equals(operate)){//to查看保单页
				mv.setViewName("cl/policyDetail");
			}else if("claim".equals(operate)){//to理赔申请页
				mv.setViewName("cl/policyClaim");
			}
			mv.addObject("policyDto", policyDto);
			req.getSession().setAttribute("policyDto", policyDto);
		}
		return mv;
	}
	/**
	 * @desc 处理理赔申请
	 * @author 陈利
	 * @date 2017年11月13日
	 */
	@RequestMapping("/claimPolicy")
	public String claimPolicy(ClaimDetailsDto claimDetailsDto,@RequestParam("pics") MultipartFile[] pics,HttpServletRequest req){
		String path=req.getSession().getServletContext().getRealPath("/");//获取绝对路径
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
		PolicyDto policyDto=(PolicyDto) req.getSession().getAttribute("policyDto");
		EmployeeDto employeeDto=(EmployeeDto) req.getSession().getAttribute("employee");
		salesService.claimPolicy(employeeDto,policyDto,claimDetailsDto);
		return "redirect:/sales/listPolicys/5";
	}
	/**
	 * @desc 查看理赔进度详情
	 * @author 陈利
	 * @date 2017年11月13日
	 */
	@RequestMapping("/claimDetail/{id}")
	public ModelAndView getClaimDetailById(ModelAndView mv,@PathVariable("id") String id){
		ClaimDetailsDto claimDetailsDto = salesService.getClaimDetailById(id);
		if(claimDetailsDto!=null){
			mv.setViewName("cl/policyClaimProcess");
			mv.addObject("claimDetailsDto", claimDetailsDto);
		}
		return mv;
	}
}
