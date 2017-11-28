package com.zl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zl.dto.CheckDetailDto;
import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.OrderDto;
import com.zl.dto.PolicyDto;
import com.zl.util.PageUtil;
import com.zl.util.Query;

/**
 * @desc 业务员dao层
 * @author 陈利
 * @date 2017年11月8日
 */
public interface SalesDao {
	/**
	 * @desc 查询订单数量(待支付/待核实)
	 * @author 陈利
	 * @date 2017年11月8日
	 */
	public int countOrdersByState(Query query);
	/**
	 * @desc 分页查询订单列表(待支付/待核实)
	 * @author 陈利
	 * @date 2017年11月9日
	 */
	public List<OrderDto> listOrders(PageUtil pageUtil);
	/**
	 * @desc 通过ID查询订单详情
	 * @author 陈利
	 * @date 2017年11月8日
	 */
	public OrderDto getOrderById(String id);
	/**
	 * @desc 插入待核实订单详情
	 * @author 陈利
	 * @date 2017年11月12日
	 */
	public int insertCheckDetails(CheckDetailDto checkDetailDto);
	/**
	 * @desc 更改订单状态/删除
	 * @author 陈利
	 * @date 2017年11月12日
	 */
	public int updateOrderStateById(@Param("id") String id,@Param("state") Integer state,@Param("del_mark") String del_mark); 
	/**
	 * @desc 添加多图
	 * @author 陈利
	 * @date 2017年11月12日
	 */
	public int addPic(@Param("id") String id,@Param("picList") List<String> picList);
	/**
	 * @desc 业务员核保通过,将订单信息插入到保单
	 * @author 陈利
	 * @date 2017年11月12日
	 */
	public int insertPolicyFromOrder(String id);
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * @desc 查询保单数量(生效中/待续保/待审核/业务员审核通过/经理审核通过/已驳回/已赔付)
	 * @author 陈利
	 * @date 2017年11月9日
	 */
	public int countPolicysByState(Query query);
	/**
	 * @desc 通过ID查询保单详情
	 * @author 陈利
	 * @date 2017年11月8日
	 */
	public PolicyDto getPolicyById(String id);
	/**
	 * @desc 分页查询保单列表(生效中/待续保/待审核/业务员审核通过/经理审核通过/已驳回/已赔付)
	 * @author 陈利
	 * @date 2017年11月10日
	 */
	public List<PolicyDto> listPolicys(PageUtil pageUtil);
	/**
	 * @desc 更改保单状态
	 * @author 陈利
	 * @date 2017年11月12日
	 */
	public int updatePolicyStateById(@Param("id") String id,@Param("state") Integer state);
	/**
	 * @desc 插入业务员处理的理赔详情
	 * @author 陈利
	 * @date 2017年11月13日
	 */
	
	public int insertClaimDetails(ClaimDetailsDto claimDetailsDto);
	/**
	 * 添加理赔处理意见
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	int updateClaimDetails(ClaimDetailsDto claimDetailsDto);
	/**
	 * @desc 查看订单核实详情
	 * @author 陈利
	 * @date 2017年11月11日
	 */
	public CheckDetailDto getCheckDetailDto(String id);
}
