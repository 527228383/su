package com.zl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zl.dao.InsureDao;
import com.zl.dto.AccountDto;
import com.zl.dto.AssurerDto;
import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.CommentDto;
import com.zl.dto.InsureDto;
import com.zl.dto.OrderDto;
import com.zl.dto.PolicyDto;
import com.zl.dto.ProductDto;
import com.zl.dto.QuoteDto;
import com.zl.service.InsureService;
import com.zl.util.PageUtil;
import com.zl.util.Query;
/**
 * @author 姜佳丽
 *用户服务层实现类
 * 2017年11月7日
 */
@Service
@SuppressWarnings("all")
public class InsureServiceImpl implements InsureService {
	@Autowired
	private InsureDao insureDao;

	/**
	 * 用户登录
	 * 苏建华
	 * 2017年11月7日
	 */
	@Override
	//@Cacheable(value="IneureLogin",keyGenerator="wiselyKeyGenerator")
	public InsureDto insureLogin(String ins_tel, String ins_pwd) {
		if(ins_tel!=null && ins_pwd!=null){
			return insureDao.insureLogin(ins_tel, ins_pwd);
		}else{
			
			return null;
		}
	}


	/**
	 * 用户注册
	 * 苏建华
	 * 2017年11月7日
	 */
	@Override
	@Transactional(rollbackFor={Exception.class})
	public boolean insureregister(InsureDto insure) {
		int num1=insureDao.insureRegister(insure);
		AccountDto adt=new AccountDto();
		adt.setIns_id(insure.getId());
		int num2=insureDao.createaccount(adt);
		if(num1==1&&num2==1){
			return true;
		}else{
			return false;
		}
	}


	/**
	 *@重写方法
	 *@操作者 彭杰
	 *@描述     填写购买资料后同时修改投保人信息,添加被保人姓名以及添加订单;如果投保人和被保人信息存在则不作修改,
	 *		同时根据被保人和投保人信息生成订单
	 *@Transactional 事务配置
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.READ_COMMITTED,timeout=36000,rollbackFor=Exception.class)
	public boolean addDatum(InsureDto insure, AssurerDto asurer, ProductDto pro,QuoteDto quo,HttpServletRequest req) {
		OrderDto order = new OrderDto();//创建一个订单对象
		InsureDto insureOne = (InsureDto) req.getSession().getAttribute("insure");//从session中取出当前登录人的信息
		//判断如果当前登录人的信息不全那么就补全
		if(insureOne.getIns_city()==null || insureOne.getIns_name()==null || insureOne.getIns_id_card()==null || insureOne.getIns_tel()==null || insureOne.getIns_email()==null){
			insure.setId(insureOne.getId());//将id存入传入进来的投保人
			int x = insureDao.updateInsure(insure);//修改投保人信息
		}
		//根据身份证号码查询被保人,如果存在就跳过,不存在就添加一条信息
		AssurerDto asure = insureDao.selectAssurer(asurer.getAss_id_card());
		if(asure==null){
			int y = insureDao.addAssurer(asurer);
			req.getSession().setAttribute("asurer",asurer);
		}
		//将数据存入订单对象
		if(asure!=null){
		    order.setAssurerDto(asure);//被保人信息
		}else{
		    order.setAssurerDto(asurer);//被保人信息
		}
		order.setInsureDto(insureOne);//投保人信息
		order.setD_coverage(quo.getCoverage());//金额
		order.setD_insured_amount(quo.getInsured_amount());//赔付金额
		order.setD_pro_id(quo.getPro_id());//产品id
		int z = insureDao.addOrder(order);//生成订单
		req.getSession().setAttribute("order_id", order.getId());
		if(z>0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 *@重写方法
	 *@操作者 彭杰
	 *@描述 支付订单(修改钱包的金额)并且根据订单的金额来确定订单是否生效
	 */
    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.READ_COMMITTED,timeout=36000,rollbackFor=Exception.class)
    public boolean updatePayment(Map map,HttpServletRequest req){
        int y = insureDao.update_dd(map);//根据传过来的值修改订单的状态
        //从session中取出投保人的信息
        InsureDto insureOne = (InsureDto) req.getSession().getAttribute("insure");
        map.put("ins_id",insureOne.getId());//将投保人ID存入map集合
        double discount=insureDao.selectDiscount(insureOne.getId());//根据用户id查询出优惠券的金额
        map.put("discount", discount);//将优惠券的值存入map 集合
          int x = insureDao.updateAccount(map);//根据传入的条件修改钱包的金额
        if("2".equals(map.get("typeid"))){
            int z = insureDao.addPolicy((List<String>) map.get("updateid"));//添加保单
        }
        if(x>0 && y>0){
            return true;
        }else{
            return false;
        }
    }
	
	/* (non-Javadoc)
	 * 注册时查询电话
	 */
	@Override
	public InsureDto selecttel(String tel) {
		return insureDao.selecttel(tel);
	}



	@Override
	public AccountDto selectaccount(String ins_id) {
		return insureDao.selectaccount(ins_id);
	}


	/* 
	 * 查询订单服务层
	 */
	@Override
	public List<OrderDto> selectOrder(Query query,HttpServletRequest req,String type,PageUtil pu) {
		
		Map<String, Object> map=new HashMap<String, Object>();
		InsureDto isd= (InsureDto) req.getSession().getAttribute("insure");
	
		map.put("ins_id",isd.getId());
		map.put("pageutil",pu);
		map.put("query",query);
		map.put("type", type);

		if(query!=null){
			int num=nopaynum(map);
			pu.setRowSize(num);
			req.getSession().setAttribute("PageUtil",pu);
		}
		return insureDao.selectOrder(map);
	}

	
	@Override
	//查询保单的服务层
	public List<PolicyDto> selectcomment(HttpServletRequest req,String type,
			String condition,String page,int pagesize) {
		
		Map<String, Object> map=new HashMap<String, Object>();
		InsureDto isd= (InsureDto) req.getSession().getAttribute("insure");
		PageUtil pu=repage(page,pagesize,req);
		
		map.put("pageutil",pu);
		map.put("condition",condition);
		map.put("type",type);
		map.put("ins_id",isd.getId());
		
		int num=continuepay(map);
		pu.setRowSize(num);
		int pagesum=pu.getTotalPage();
		req.getSession().setAttribute("pagesum",pagesum);
		req.getSession().setAttribute("condition",condition);
		return insureDao.selectcomment(map);
	}



	/* 
	 * 待续保数量
	 */
	@Override
	public int continuepay(Map map) {
		return insureDao.continuepay(map);
	}


	/* 
	 * 待支付数量
	 */
	@Override
	public int nopaynum(Map map) {
		return insureDao.nopaynum(map);
	}



	/* 
	 * 添加评论
	 */
	@Override
	@Transactional(rollbackFor={Exception.class})
	public boolean addComment(String policy_id,CommentDto comment) {
		Map map=new HashMap();
		map.put("com_mark", "0");//评论标记：0为已评论，1为未评论
		map.put("id", policy_id);
		try {
			int flag=insureDao.addComment(comment);
			insureDao.update_policy(map);
			return true;
		} catch (Exception e) {
			return false;
		}
	
		
	}



	/* 
	 * 修改订单状态
	 */
	@Override
	public int update_dd(Map map) {
		return insureDao.update_dd(map);
	}

	/* 
	 * 得到分页对象
	 */
	public PageUtil repage(String page,int pagesize,HttpServletRequest req){
		PageUtil pu=new PageUtil();
		if(page==null){
			pu.setCurrentPage(1);
			req.getSession().setAttribute("page","1");
		}else{
			pu.setCurrentPage(Integer.parseInt(page));
			req.getSession().setAttribute("page",page);
		}
		//设置每页条数
		pu.setPageSize(pagesize);
		return pu;
	}

	/* 
	 * 修改保单状态（理赔后）
	 */
	@Override
	public int update_policy(Map map) {
		return insureDao.update_policy(map);
	}

	/**
	 * 插入理赔表
	 */
	@Override
	public int insertClaimDetails(ClaimDetailsDto claimDetails) {
		return insureDao.insertClaimDetails(claimDetails);
	}

	/**
	 * 添加流程实例 id
	 */
	@Override
	public int updateProcessId(ClaimDetailsDto claimDetails) {
		return insureDao.updateProcessId(claimDetails);
	}

	/* 
	 * 续保方法
	 */
	@Transactional(rollbackFor={Exception.class})
	@Override
	public boolean updatepolicybyid(Map map) {
		
			int num1=insureDao.moneypackeage(map);
			//修改保单状态
			int num2=insureDao.updatepolicybyid((String)map.get("id"));
			
			if(num1==1&&num2==1){
				return true;
			}else{
				return false;
			}	
		
	}


	/* 
	 * 钱包充值
	 */
	@Override
	public boolean moneypackeage(Map map) {
		// TODO Auto-generated method stub
		int num= insureDao.moneypackeage(map);
		if(num==1){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * @zxl
	 * 2017年11月17日
	 * @desc
	 */
	
}
