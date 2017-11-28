package com.zl.service;

import java.util.List;
import java.util.Map;

import com.zl.dto.CheckDetailDto;
import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.EmployeeDto;
import com.zl.dto.OrderDto;
import com.zl.dto.PolicyDto;
import com.zl.util.PageUtil;
import com.zl.util.Query;

/**
 * @desc 业务员服务层
 * @author 陈利
 * @date 2017年11月8日
 */
public interface SalesService {
	/**
	 * @desc 通过状态查询订单数量(待支付/待核实)
	 * @author 陈利
	 * @date 2017年11月8日
	 */
	public int countOrdersByState(Query query);
	/**
	 * @desc 查询订单详情
	 * @author 陈利
	 * @date 2017年11月8日
	 */
	public OrderDto getOrderById(String id);
	/**
	 * @desc 通过状态分页查询订单列表(待支付/待核实)
	 * @author 陈利
	 * @date 2017年11月9日
	 */
	public List<OrderDto> listOrders(PageUtil pageUtil);
	/**
	 * @desc 处理待核实订单
	 * @author 陈利
	 * @param orderDto 
	 * @date 2017年11月12日
	 */
	public boolean checkOrder(OrderDto orderDto, CheckDetailDto checkDetailDto);
	
	
	/**
	 * @desc 通过状态查询保单数量(生效中/待续保/待审核/业务员审核通过/经理审核通过/已驳回/已赔付)
	 * @author 陈利
	 * @date 2017年11月9日
	 */
	public int countPolicysByState(Query query);
	/**
	 * @desc 查询保单详情
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
	 * @desc 处理理赔申请
	 * @author 陈利
	 * @date 2017年11月13日
	 */
	public boolean claimPolicy(EmployeeDto employeeDto,PolicyDto policyDto,ClaimDetailsDto claimDetailsDto);
	/**
	 * @desc 查看理赔进度详情
	 * @author 陈利
	 * @date 2017年11月13日
	 */
	public ClaimDetailsDto getClaimDetailById(String id);
	
	/**
	 * 处理理赔
	 *
	 * @author 苏建华
	 * 2017年11月15日
	 */
	Map<String, Object> dealWithClaimDetails(ClaimDetailsDto claimDetailsDto);
	/**
	 * @desc 查看核实详情
	 * @author 陈利
	 * @date 2017年11月11日
	 */
	public CheckDetailDto getCheckDetailDto(String id);
}
