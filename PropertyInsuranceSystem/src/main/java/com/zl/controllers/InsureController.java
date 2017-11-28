package com.zl.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zl.dto.AccountDto;
import com.zl.dto.AssurerDto;
import com.zl.dto.CityDto;
import com.zl.dto.CommentDto;
import com.zl.dto.InsureDto;
import com.zl.dto.OrderDto;
import com.zl.dto.PolicyDto;
import com.zl.dto.ProductDto;
import com.zl.dto.ProvinceDto;
import com.zl.dto.QuoteDto;
import com.zl.service.AreaService;
import com.zl.service.InsureService;
import com.zl.service.ProductService;
import com.zl.service.SalesService;
import com.zl.util.PageUtil;
import com.zl.util.Query;

@Controller
@RequestMapping("/insure/")
@SuppressWarnings("all")
public class InsureController {
	@Autowired
	private InsureService insureService;
	
	@Autowired
	private ProductService productService; 
	
	@Autowired
	private SalesService salesService;
	
	@Autowired
	private AreaService areaService;

	/**
	 * 
	 * 
		返回到登录页面
	 */
	@RequestMapping("/login")
	public String login(){
		return "Client/login";
	}
	
	/**
	 * 尚奔科
	 * 注册、登录时通过ajax获取短信验证码
		@2017年11月7日
	 */
	@ResponseBody
	@RequestMapping("/makemes/{ins_tel}")
	//Request URL 
	//https:way.jd.com/CL253/cl253_json?phone=13917969023&msg=【253云通讯】您的验证码是123456&appkey=fef5bbe50cd2d3dbd31efc2f8fbb8e8d
	public Map<String, String> makemessagecode(@PathVariable("ins_tel") String ins_tel){
		
		
		 Map<String, String> map=new HashMap<String, String>();
		 String Url = "https://way.jd.com/chuangxin/VerCodesms?"; 
		 HttpClient client = new HttpClient();   
	     PostMethod method = new PostMethod(Url);   
	     client.getParams().setContentCharset("UTF-8");  
	     method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8"); 
	     
	     String vcode="";
			 //生成验证码 
		    for (int i = 0; i < 6; i++) {
		        vcode = vcode + (int) (Math.random() * 9);
		    }
		    
		   // String content = new String("您的验证码是："+vcode+"。请不要把验证码泄露给其他人。");   
	        NameValuePair[] data = {//提交短信  
	                new NameValuePair("account", "cl743504552"),   
	                new NameValuePair("password", "cl74350455"),                  
	                new NameValuePair("mobile",ins_tel),   
	                //new NameValuePair("content", content),  
	                new NameValuePair("appkey", "88f832fb49e8df1d912ae481b0fc2bb4"), 
	                new NameValuePair("content", "【成都创信】您的验证码是"+vcode), 
	        };  
	        method.setRequestBody(data);          
	        try {  
	            client.executeMethod(method);         
	            System.out.println(method.getResponseBodyAsString());
	            map.put("vcode", vcode);
	              
	        } catch (HttpException e) {  
	            e.printStackTrace();  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }
	        
	        return map;
	}
	/**
	 * ajax登录
	 * @姜佳丽
	 * @2017年11月7日
	 */
	@RequestMapping("/insureLogin/{ins_tel}/{ins_pwd}/{baocun}")
	public void insureLogin(@PathVariable("ins_tel")String ins_tel, @PathVariable("ins_pwd")String ins_pwd,@PathVariable("baocun")boolean baocun,HttpServletRequest req, HttpServletResponse res){
		PrintWriter writer = null;
		String msg = "";
		try {
		InsureDto insure=insureService.insureLogin(ins_tel, ins_pwd);
		if(insure != null){
			if(baocun){
				//保存用户名密码 cookie
				Cookie cookieTel=new Cookie("cookieTel", ins_tel);
				Cookie cookiePwd=new Cookie("cookiePwd", ins_pwd);
				cookieTel.setMaxAge(60*60*24);
				cookiePwd.setMaxAge(60*60*24);
				cookieTel.setPath("/");
				cookiePwd.setPath("/");
				res.addCookie(cookieTel);
    	 		res.addCookie(cookiePwd);
			}
			//将登陆用户保存到 session 作用域中
			req.getSession().setAttribute("insure", insure);
			msg="{\"msg\":true}";
		}
			else{
				msg="{\"msg\":false}";
			}
			writer = res.getWriter();
			writer.write(msg);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			writer.close();
		}
	}
	
	/**
	 * @创建人 彭杰
	 * @创建时间 2017年11月16日
	 * @方法描述：注销session退出登录,跳转到首页
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest req){
	    req.getSession().removeAttribute("insure");
	    return "redirect:/insure/index";
	}
	
	/**
	 * @描述  调用身份证接口这个链接只能测试十次!用完自己再去找
	 * @日期 2017年11月9日
	 * @操作者 彭杰
	 */
	//https://way.jd.com/DetectionScience/idcard2?identityNo=110101201701010000&name=张三&appkey=8aa08a080398dbc08b0b1039d28a6595
	@RequestMapping(value = "insertIDCard", method = RequestMethod.GET)
	public @ResponseBody String note(String realName ,String cardNo) throws IOException{
		 String Url = "https://way.jd.com/freedt/api_rest_police_identity?"; 
		 HttpClient client = new HttpClient();   
	     PostMethod method = new PostMethod(Url);   
	     client.getParams().setContentCharset("UTF-8");  
	     method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8"); 
	     
	        NameValuePair[] data = {//提交验证信息
	                new NameValuePair("account", "cl743504552"),   
	                new NameValuePair("password", "cl74350455"),                  
	                new NameValuePair("name", realName),   
	                new NameValuePair("idCard", cardNo), 
	                new NameValuePair("appkey", "88f832fb49e8df1d912ae481b0fc2bb4"), 
	        };  
	        method.setRequestBody(data);          
	        try {  
	            client.executeMethod(method);         
	            System.out.println(method.getResponseBodyAsString());  
	              
	        } catch (HttpException e) {  
	            e.printStackTrace();  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }   
	        return method.getResponseBodyAsString();
	}
	
	/**
	 * 尚奔科
	 * 用户注册功能的页面
		@2017年11月7日
	 */
	@RequestMapping("/regindex")
	public ModelAndView register(ModelAndView mv){
		mv.setViewName("Client/register");
		return mv;
	}
	


	/**
	 * 尚奔科
		@2017年11月8日
		验证电话号码是否被注册
	 */
	@ResponseBody
	@RequestMapping("/isexist/{tel}")
	public Map<String, Object> selecttel(@PathVariable("tel") String tel,HttpServletRequest req){
		Map<String, Object> map=new HashMap<String, Object>();
		InsureDto id=insureService.selecttel(tel);
		if(id!=null){
			map.put("meg", false);
			req.getSession().setAttribute("insure", id);
		}else{
			map.put("meg", true);
		}
		return map;
	}

	/**
	 * 用户注册
	 */
	@SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping("/register")
	public Map<String, Object> insureRegister(InsureDto insure,String rand,HttpServletRequest req){
		Map<String, Object> map=new HashMap<String, Object>();
		String rd=(String) req.getSession().getAttribute("rand");
		if(rd.equals(rand)){
			map.put("meg",true);
			boolean f=insureService.insureregister(insure);
		}else{
			map.put("meg", false);
		}
		return map;
		
	}
	
	@RequestMapping("/image")
	public String t(){
		return "Client/image";
	}
	


	/**
	 * 尚奔科
		@2017年11月9日
		个人中心展示的固定数据
	 */
	@RequestMapping("/showfirst")
	public ModelAndView showfirst(ModelAndView mv,HttpServletRequest req){
		mv.setViewName("Client/mycenter");
		InsureDto isd= (InsureDto) req.getSession().getAttribute("insure");
		//查询用户账户
		AccountDto acc= insureService.selectaccount(isd.getId());
		//查询待评论的数量
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("ins_id",isd.getId());
		//用作数据库查询时的标识
		map.put("typeid","1");
		int nocomment=insureService.continuepay(map); 
		req.getSession().setAttribute("nocomment", nocomment);
		//查询待续保的数量
		map.put("typeid","2");
		int continuepay=insureService.continuepay(map);
		req.getSession().setAttribute("continuepay",continuepay);
		//查询待支付的数量
		map.put("stateid",1);
		int nopaynum=insureService.nopaynum(map);
		req.getSession().setAttribute("nopaynum",nopaynum);
		mv.addObject("acc", acc);
		return mv;
	}
	/**
	 * 尚奔科
		@2017年11月8日
		个人中心首页展示的可变数据
	 */
	@RequestMapping("/firstpage/{type}")
	public ModelAndView showFirstpage(ModelAndView mv,HttpServletRequest req,String page,
			@PathVariable("type")String type){
		
		List nopay=new ArrayList();
		
		PageUtil pu= insureService.repage(page, 3, req);
		//如果type是1，查询未支付订单
		if(type.equals("1")){
			nopay=insureService.selectOrder(null, req, "1",pu);
			mv.addObject("ye","1");
			pu.setRowSize((Integer)req.getSession().getAttribute("nopaynum"));
		}

		//查询待续保订单
		if(type.equals("2")) {
			nopay=insureService.selectcomment(req, type, null, page, 3);
			mv.addObject("ye","2");
			pu.setRowSize((Integer)req.getSession().getAttribute("continuepay"));
		}
		//查询待评论保单
		if(type.equals("3")){
			nopay=insureService.selectcomment(req, type, null, page, 3);
			mv.addObject("ye","3");
			pu.setRowSize((Integer)req.getSession().getAttribute("nocomment"));
		}
		mv.addObject("nopay",nopay);
		req.getSession().setAttribute("totalpage",pu.getTotalPage());
		mv.setViewName("Client/secondpage");
		return mv;
	}
	

	/**
	 * 尚奔科
		@2017年11月10日
		我的保险——我的订单
		
	 */
	@RequestMapping("showOrder")
	public ModelAndView showOrder(ModelAndView mv,
			Query query,PageUtil pu,HttpServletRequest req){
		
		if(pu.getCurrentPage()==null){
			pu.setCurrentPage(1);
		}
		pu.setPageSize(6);
		if(query.getTime_mark()==null){
			query.setTime_mark("1");
		}
		if(query.getTypeid()==null){
			query.setTypeid("1");
		}
 		List<OrderDto> ls=insureService.selectOrder(query,req,null,pu);
		mv.setViewName("Client/Myorder");
		mv.addObject("ls",ls);
		mv.addObject("query",query);
		return mv;
	}
	/**
	 * @个人中心-查询保单
	 * 如果type是1，表示查询的是生效中的
	 * 如果type是2，表示查询的是待续保的
	 * 具体业务逻辑在service层
	 */
	@RequestMapping("selectpolicy")
	public ModelAndView selectpolicy(HttpServletRequest req,ModelAndView mv,String type,
			String condition,String page){
		if(type==null){
			type="1";
		}
		
		List<PolicyDto> ls=insureService.selectcomment(req,type,condition,page,6);
		mv.setViewName("Client/Mypolicy");
		mv.addObject("ls",ls);
	
		mv.addObject("condition",condition);
		mv.addObject("type",type);
		return  mv;
	}

	/**
	 * 理赔查询
	 * @return
	 */
		@RequestMapping("selectlipei")
		public ModelAndView selectlipei(HttpServletRequest req,ModelAndView mv,String condition,String page){
			List<PolicyDto> ls=insureService.selectcomment(req,"4",condition,page,6);
			mv.setViewName("Client/claims");
			mv.addObject("ls",ls);
			return mv;
		}

		/**
		 * @描述  点击立即报价按钮跳转到填写资料页面(判断是否登录如果未登录跳转到登录页面)
		 * @日期 2017年11月10日
		 * @操作者 彭杰
		 */
	@RequestMapping("selectQuote")
	public ModelAndView selectQuote(HttpServletRequest req,String id){
		ModelAndView mv = new ModelAndView();
		InsureDto insureOne = (InsureDto) req.getSession().getAttribute("insure");
		if(insureOne==null){
			mv.setViewName("Client/login");
			return mv;
		}
		//根据ID查询产品详细信息
		ProductDto pro=productService.getProduct(id);
		//查询省份
		List<ProvinceDto> province = areaService.listProvince();
		mv.addObject("pro", pro);
		mv.addObject("province", province);
		mv.setViewName("Client/fillInDatum");
		return mv;
	}
	
	/**
	 * @描述 提交购买资料
	 * @日期 2017年11月8日
	 * @操作者 彭杰
	 */
	@RequestMapping("addDatum")
	public ModelAndView addDatum(InsureDto insure, AssurerDto asurer,ProductDto pro,QuoteDto quo,HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		boolean falg = insureService.addDatum(insure, asurer, pro,quo,req);
		if(falg){ 
		    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy年MM月dd日");  
		    java.util.Date currentTime = new java.util.Date();//得到当前系统时间  
		    String str_date1 = formatter.format(currentTime); //将日期时间格式化  
		    String str_date2 = str_date1.toString(); //将Date型日期时间转换成字符串形式
			mv.addObject("coverage",quo.getCoverage());
			mv.addObject("insured_amount",quo.getInsured_amount());
			mv.addObject("pro", pro);
			mv.addObject("time", str_date2);
			mv.setViewName("/Client/payment");
		}else{
			mv.setViewName("/Client/error");
		}
		return mv;
	}

	
	/**
     * @描述  支付订单根据订单的金额判断是否生效!(金额大于一定数额要经过审核才能生效)
     * @日期 2017年11月10日
     * @操作者 彭杰
     * @参数 :订单id数组 ord_id,标识符:String typeid(判断是否删除订单还是待审核),支付的金额: QuoteDto(根据情况传入赔付金额)
     */
    @SuppressWarnings("unused")
    @RequestMapping("updatePayment")
    public String updatePayment(QuoteDto quo,String[] ord_id,String typeid,HttpServletRequest req,String condition){
        //从session中取出用户信息
        InsureDto insureOne = (InsureDto) req.getSession().getAttribute("insure");
        //查询出账户信息
        AccountDto acc= insureService.selectaccount(insureOne.getId());
        //如果余额不够支付订单跳转到充值页面
        if(acc==null || acc.getBalance()<quo.getCoverage()){
            return "redirect:/insure/returnmoneypackage";
        }
        
        String s=req.getHeader("Referer");
        List<String> updateid = new ArrayList<String>();
        
        String money="1";//标识符(支付1,提现2,退款3)
        if(ord_id!=null && ord_id.length>0){//判断订单id数组是否为空,不为空则是从别的页面支付
            updateid = Arrays.asList(ord_id); 
        }else{//如果没有就是填完信息直接支付,从session中取出订单id
            String  order_id=(String) req.getSession().getAttribute("order_id");
            updateid.add(order_id);
            if(quo.getInsured_amount()<500000){
                typeid="2";
            }else{
                typeid="3";
            }
        }
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("updateid", updateid);
        map.put("typeid", typeid);//标识符(1删除订单,2支付订单直接生效,3支付订单待审核)
        map.put("quo",quo);
        map.put("money",money);//标识符(支付1,提现2,退款3)
        boolean falg = insureService.updatePayment(map,req);
        if(falg){  
        	if(condition!=null){
        		return "redirect:"+s;
        	}
            return "Client/skip";
        }
        return "Client/error";
    }

    
    /**
     * @创建人 彭杰
     * @创建时间 2017年11月17日
     * @方法描述： ajax根据省份id查询城市
     */
    @RequestMapping("Province")
	public @ResponseBody List selectProvince(String province_code){
        List<CityDto> city = areaService.listCityByPrivinceCode(province_code);
	    return city;
	}

    /**
	 * @姜佳丽
	 * @2017年11月9日
	 * 点击评论调到评论页面
	 */
	@RequestMapping("writeComment/{id}")
	public ModelAndView writeComment(@PathVariable String id,HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		PolicyDto policyDto=salesService.getPolicyById(id);
		mv.addObject("policyDto", policyDto);
		mv.setViewName("Client/pinglun");
		
		String retUrl = req.getHeader("Referer");
		String s=retUrl.substring(16);
		req.getSession().setAttribute("retUrl",s);
		
		return mv;
		
	}
	/**
	 * 
	 * @姜佳丽
	 * 2017年11月12日
	 * @desc添加评论
	 */
	@RequestMapping("addComment")
	public ModelAndView addComment(String policy_id,CommentDto comment,HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		boolean flag = insureService.addComment(policy_id,comment);
	
		if(flag){
			mv.setViewName("redirect:"+req.getSession().getAttribute("retUrl"));
			
			return mv;
		}else{
			mv.setViewName("Client/pinglun");
			return mv;
		}
		
	}	
	/**
	 * 尚奔科
		@2017年11月10日
		删除订单（用户未支付时删除），typeid为1
		用户已支付并且订单已经生效成为保单（删除订单,并且增加支付时间），typeid为2
		用户已经支付还未生效处在核实中（修改订单状态为核实中，增加支付时间）,typeid 为3
	 */
	@RequestMapping("update_dd/{typeid}")
	public String update_dd(@PathVariable("typeid")String typeid, String[] updateid,HttpServletRequest req){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("typeid", typeid);
		map.put("updateid",Arrays.asList(updateid));
		insureService.update_dd(map);
		String s=req.getHeader("Referer");
		return "redirect:"+s;
	}
	/**
	 * @修改保单状态（申请理赔后修改保单状态）
	 * @return
	 */
	@RequestMapping("update_policy/{id}")
	public String update_policy(@PathVariable("id") String id,HttpServletRequest req){
		String s=req.getHeader("Referer");
		Map map=new HashMap();
		map.put("stateid",5);
		map.put("id",id);
		insureService.update_policy(map);
		return "redirect:"+s;
	}

	
	/**
	 * 查询保单详情
	 * @return
	 */
	@ResponseBody
	@RequestMapping("selectPolicyByid/{id}")
	public PolicyDto selectPolicyByid(@PathVariable String id){
		return salesService.getPolicyById(id);
	}
	/**
	 * 查询订单详情
	 * @return
	 */
	
	@RequestMapping("selectOrderByid/{id}")
	public ModelAndView selectOrderByid(@PathVariable String id,ModelAndView mv){
		OrderDto od= salesService.getOrderById(id);
		mv.addObject("orderDto",od);
		mv.setViewName("Client/orderdetail");
		return mv;
	}
	
	
	/**
	 * 首页
	 */
	@RequestMapping("index")
	public String index(){
		return "Client/index";
	}
	
	/**
	 * @zxl
	 * 2017年11月17日
	 * @续保时调用的方法
	 */
	@RequestMapping("continuepolicy")
	public String continuepolicy(String id,String count,HttpServletRequest req){
		String s=req.getHeader("Referer");
		InsureDto insureOne = (InsureDto) req.getSession().getAttribute("insure");
		Map map=new HashMap();
		map.put("id",id);
		map.put("ins_id",insureOne.getId());
		map.put("mark",'2');
		map.put("count",count);
		map.put("mark1",'2');
		boolean b=insureService.updatepolicybyid(map);
		if(b){
			return "redirect:"+s;
		}else{
			return "500";
		}
	}
	
	
	/**
	 * @zxl
	 * 返回个人中心首页
	 * @desc
	 */
	@RequestMapping("backmycenter")
	public String backMycenger(){
		return "Client/mycenter";
	}
	
	/**
	 * @zxl
	 * 2017年11月18日
	 * 查询我的钱包金额
	 */
	@RequestMapping("returnmoneypackage")
	public ModelAndView returnmoneypackage(HttpServletRequest req,ModelAndView mv){
		
		InsureDto isd= (InsureDto) req.getSession().getAttribute("insure");
		//查询用户账户
		AccountDto acc= insureService.selectaccount(isd.getId());
		mv.addObject("account", acc);
		mv.addObject("insure",isd);
		mv.setViewName("Client/moneypackage");
		return mv;
	}
	
	/**
	 * @zxl
	 * 我的钱包充值提现
	 * @desc
	 */
	@RequestMapping("balance")
	public String balance(String ins_id,String mark,String count){
		Map map=new HashMap();
		map.put("ins_id",ins_id);
		map.put("mark",mark);
		map.put("count",count);
		boolean f=insureService.moneypackeage(map);
		if(f){
			return "redirect:/insure/returnmoneypackage";
		}else{
			return "500";
		}
		
	}
	
}
