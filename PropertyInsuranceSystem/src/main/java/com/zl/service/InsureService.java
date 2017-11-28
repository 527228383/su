package com.zl.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.zl.dto.AccountDto;
import com.zl.dto.AssurerDto;
import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.CommentDto;
import com.zl.dto.InsureDto;
import com.zl.dto.OrderDto;
import com.zl.dto.PolicyDto;
import com.zl.dto.ProductDto;
import com.zl.dto.QuoteDto;
import com.zl.util.PageUtil;
import com.zl.util.Query;


/**
 * 用户登录
 * @author 姜佳丽
 *
 * 2017年11月7日
 */
@SuppressWarnings("all")
public interface InsureService {
	
	public InsureDto insureLogin(String ins_tel,String ins_pwd);
	
	
	/**
	 * 尚奔科
	 * 用户注册
		@2017年11月7日
	 */
	public boolean insureregister(InsureDto insure);

	
	
	/**
	 * @描述 填写购买资料后同时修改投保人信息,添加被保人姓名以及添加订单如果投保人和被保人信息存在则不作修改
	 * @日期 2017年11月8日
	 * @操作者 彭杰
	 */
	public boolean addDatum(InsureDto insure,AssurerDto asurer,ProductDto pro,QuoteDto quo,HttpServletRequest req);

	/**
	 * @创建人 彭杰
	 * @创建时间 2017年11月14日
	 * @方法描述：支付订单时根据传输过来的数据,删除或修改订单状态,生成保单
	 */
	public boolean updatePayment(Map map,HttpServletRequest req);
	
	/**
	 * 尚奔科
	 * 用户注册时验证电话号码是否被注册
		@2017年11月8日
	 */
	public InsureDto selecttel(String tel);

	
	/**
	 * 尚奔科
		@2017年11月8日
		查询个人账户
	 */
	public AccountDto selectaccount(String ins_id);

	/**
	 * 尚奔科
		@2017年11月9日
		查询订单
	 */
	public List<OrderDto> selectOrder(Query query,HttpServletRequest req,String type,PageUtil pu);

	
	/**
	 * 尚奔科
	 * 查询待评论保单表
		@2017年11月9日
	 */
	public List<PolicyDto> selectcomment(HttpServletRequest req,String type,
			String condition,String page,int pagesize);
	
	/**
	 * 尚奔科
		@2017年11月9日
		查询待续保保单数量
	 */
	public int continuepay(Map map);
	
	/**
	 * 尚奔科
		@2017年11月9日
		查询待评论保单数量
	 */
	public int nopaynum(Map map);

	/**
	 * 评论
	 * @姜佳丽
	 * @2017年11月10日
	 */
	public boolean addComment(String policy_id,CommentDto comment);

	
	/**
	 * 尚奔科
		@2017年11月10日
		删除订单（用户未支付时删除）
		用户已支付并且订单已经生效成为保单（删除订单,并且增加支付时间）
		用户已经支付还未生效处在核实中（修改保单状态为核实中，增加支付时间）
	 */
	public int update_dd(Map map);

	
	public PageUtil repage(String page,int pagesize,HttpServletRequest req);

	public int update_policy(Map map);
	
	
	
	/**
	 * 插入理赔表
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	int insertClaimDetails(ClaimDetailsDto claimDetails);
	
	/**
	 * 添加流程实例 id
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	int updateProcessId(ClaimDetailsDto claimDetails);
	
	/**
	 * @zxl
	 * 2017年11月17日
	 * @续保方法
	 */
	public boolean updatepolicybyid(Map map);
	
	/**
	 * @zxl
	 * 钱包充值提现
	 * @desc
	 */
	public boolean moneypackeage(Map map);
}


