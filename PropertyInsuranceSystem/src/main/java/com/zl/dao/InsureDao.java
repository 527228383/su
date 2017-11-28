package com.zl.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zl.dto.AccountDto;
import com.zl.dto.AssurerDto;
import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.CommentDto;
import com.zl.dto.InsureDto;
import com.zl.dto.OrderDto;
import com.zl.dto.PolicyDto;

/**
 * 用户dao层
 * @author 姜佳丽
 *
 * 2017年11月7日
 */
/**
 * @author 尚奔科
 *
 * 2017年11月8日
 */
@SuppressWarnings("rawtypes")
public interface InsureDao {
	/**
	 * 用户登录
	 * @姜佳丽
	 * @2017年11月7日
	 */
	public InsureDto insureLogin(@Param("ins_tel") String ins_tel,@Param("ins_pwd") String ins_pwd);
	
	/**
	 * 尚奔科
		@2017年11月7日
		用户注册dao层
	 */
	public int  insureRegister(InsureDto insure);

	
	/**
	 * @描述  修改投保人信息
	 * @日期 2017年11月8日
	 * @操作者 彭杰
	 */
	public int updateInsure(InsureDto insure);
	
	/**
	 * @描述  添加被保人信息
	 * @日期 2017年11月8日
	 * @操作者 彭杰
	 */
	public int addAssurer(AssurerDto asurer);
	
	/**
	 * @描述 添加订单信息
	 * @日期 2017年11月8日
	 * @操作者 彭杰
	 */
	public int addOrder(OrderDto order);
	
	/**
	 * @描述 根据身份证号码查询被保人
	 * @日期 2017年11月8日
	 * @操作者 彭杰
	 */
	public AssurerDto selectAssurer(String ass_id_card);
	
	
	/**
	 * @创建人 彭杰
	 * @创建时间 2017年11月11日
	 * @方法描述： 修改钱包金额根据传入的值判断是（money==1 支付，money==2提现，money==3返款）
	 */
	public int updateAccount(Map map);
	
	/**
	 * @创建人 彭杰
	 * @创建时间 2017年11月12日
	 * @方法描述：根据用户id查询优惠券
	 */
	public double selectDiscount(String ins_id);
	
	/**
	 * @创建人 彭杰
	 * @创建时间 2017年11月11日
	 * @方法描述： 添加保单
	 */
	public int addPolicy(List<String> updateid);

	/**
	 * 尚奔科
		@2017年11月8日
		注册时验证电话号码是否已经注册
	 */
	public InsureDto selecttel(String tel);

	
	/**
	 * 尚奔科
		@2017年11月8日
		访问个人中心首页时，查询账户
	 */
	public AccountDto selectaccount(String ins_id);
	
	/**
	 * 尚奔科
		@2017年11月8日
		查询未支付订单表
	 */
	public List<OrderDto> selectOrder(Map map);
	
	/**
	 * 尚奔科
		@2017年11月9日
		查询待续保保单表
		查询生效中保单
		查询
	 */
	
	public List<PolicyDto> selectcomment(Map map);
	
	
	/**
	 * 
	 * 查询待续保数量
	 */
	public int continuepay(Map map);
	
	
	/**
	 * 查询待支付数量
	 * @return
	 */
	public int nopaynum(Map map);
	

	/**
	 * @姜佳丽 评论
	 * @2017年11月10日
	 */
	public int addComment(CommentDto comment);
	
	

	/**
	 * 尚奔科
		@2017年11月10日
		删除订单（用户未支付时删除）
		用户已支付并且订单已经生效成为保单（删除订单,并且增加支付时间）
		用户已经支付还未生效处在核实中（修改保单状态为核实中，增加支付时间）
	 */
	public int update_dd(Map map);

	/**
	 * @param map
	 * @用户理赔是，修改保单状态
	 */
	public int update_policy(Map map);
	
	/**
	 * 插入理赔信息
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	public int insertClaimDetails(ClaimDetailsDto claimDetails);
	
	/**
	 * 添加流程实例id 
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	public int updateProcessId(ClaimDetailsDto claimDetails);

	/**
	 * @续保时修改保单状态
	 * 2017年11月17日
	 * @desc
	 */
	public int updatepolicybyid(String id);
	
	/**
	 * @zxl
	 * 钱包充值
	 * @desc
	 */
	public int moneypackeage(Map map);
	/**
	 * @zxl
	 * 2017年11月19日
	 * 创建账户
	 */
	public int createaccount(AccountDto adt);
}
