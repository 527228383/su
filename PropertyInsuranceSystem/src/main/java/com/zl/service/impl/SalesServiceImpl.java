package com.zl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zl.dao.ActivitiDao;
import com.zl.dao.AdminDao;
import com.zl.dao.InsureDao;
import com.zl.dao.SalesDao;
import com.zl.dto.CheckDetailDto;
import com.zl.dto.ClaimDetailsDto;
import com.zl.dto.EmployeeDto;
import com.zl.dto.OrderDto;
import com.zl.dto.PolicyDto;
import com.zl.service.SalesService;
import com.zl.util.Global;
import com.zl.util.PageUtil;
import com.zl.util.Query;
/**
 * @desc 业务员服务层实现类
 * @author 陈利
 * @date 2017年11月8日
 */
@Service
@Transactional
public class SalesServiceImpl implements SalesService {
	@Autowired
	private SalesDao salesDao;
	@Autowired
	private InsureDao insureDao;
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private ActivitiDao activitiDao;
	
	/**
	 * @desc 通过状态查询订单数量(待支付/待核实)
	 * @author 陈利
	 * @date 2017年11月8日
	 */
	@Override
	public int countOrdersByState(Query query) {
		return salesDao.countOrdersByState(query);
	}
	/**
	 * @desc 查询订单详情
	 * @author 陈利
	 * @date 2017年11月8日
	 */
	@Override
	public OrderDto getOrderById(String id) {
		return salesDao.getOrderById(id);
	}
	/**
	 * @desc 通过状态分页查询订单列表(待支付/待核实)
	 * @author 陈利
	 * @date 2017年11月9日
	 */
	@Override
	public List<OrderDto> listOrders(PageUtil pageUtil) {
		return salesDao.listOrders(pageUtil);
	}
	/**
	 * @desc 处理待核实订单
	 * @author 陈利
	 * @date 2017年11月12日
	 */
	@Override
	public boolean checkOrder(OrderDto orderDto,CheckDetailDto checkDetailDto) {
		int flag=salesDao.insertCheckDetails(checkDetailDto);//插入待核实订单详情
		String id=checkDetailDto.getIns_id();//订单号
		if(checkDetailDto.getSales_dicision()==1){//业务员同意,转生效中
			flag=salesDao.insertPolicyFromOrder(id);//(删除订单,增加到保单)
			flag=salesDao.updateOrderStateById(id, null,"0");//删除订单
		}else if(checkDetailDto.getSales_dicision()==0){//业务员不同意,转退款
			Integer state=10;//核保未通过
			flag=salesDao.updateOrderStateById(id, state, null);//更改订单状态
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("money", 3);//退款
			map.put("balance", orderDto.getD_coverage());
			flag=insureDao.updateAccount(map);
		}
		if(!checkDetailDto.getPicList().isEmpty()){
			flag=salesDao.addPic(id, checkDetailDto.getPicList());//添加多图
		}
		return flag>0?true:false;
	}
	
	
	
	
	
	
	/**
	 * @desc 通过状态查询保单数量(生效中/待续保/待审核/业务员审核通过/经理审核通过/已驳回/已赔付)
	 * @author 陈利
	 * @date 2017年11月9日
	 */
	@Override
	public int countPolicysByState(Query query) {
		return salesDao.countPolicysByState(query);
	}
	/**
	 * @desc 查询保单详情
	 * @author 陈利
	 * @date 2017年11月8日
	 */
	@Override
	public PolicyDto getPolicyById(String id) {
		return salesDao.getPolicyById(id);
	}
	/**
	 * @desc 分页查询保单列表(生效中/待续保/待审核/业务员审核通过/经理审核通过/已驳回/已赔付)
	 * @author 陈利
	 * @date 2017年11月10日
	 */
	@Override
	public List<PolicyDto> listPolicys(PageUtil pageUtil) {
		return salesDao.listPolicys(pageUtil);
	}
	/**
	 * @desc 处理理赔申请
	 * @author 陈利
	 * @date 2017年11月13日
	 */
	@Override
	public boolean claimPolicy(EmployeeDto employeeDto,PolicyDto policyDto,ClaimDetailsDto claimDetailsDto) {
		claimDetailsDto.setInsureDto(policyDto.getInsureDto());//投保人
		claimDetailsDto.setAssurerDto(policyDto.getAssurerDto());//被保人
		claimDetailsDto.setPol_id(policyDto.getId());//保单号
		claimDetailsDto.setSales_id(employeeDto.getId().toString());//登录业务员id
		int flag=salesDao.insertClaimDetails(claimDetailsDto);
		String id=claimDetailsDto.getPol_id();
		if(claimDetailsDto.getSales_dicision()==1){//业务员同意,转经理审核
			Integer state=6;
			flag=salesDao.updatePolicyStateById(id, state);//更改保单状态
		}else if(claimDetailsDto.getSales_dicision()==0){//业务员不同意,驳回
			Integer state=9;//理赔未通过
			flag=salesDao.updatePolicyStateById(id, state);//更改保单状态
		}
		if(!claimDetailsDto.getPicList().isEmpty()){
			flag=salesDao.addPic(id, claimDetailsDto.getPicList());//添加多图
		}
		return flag>0?true:false;
	}
	/**
	 * @desc 查看理赔进度详情
	 * @author 陈利
	 * @date 2017年11月13日
	 */
	@Override
	public ClaimDetailsDto getClaimDetailById(String id) {
		return adminDao.getClaimDetailsById(id);
	}
	
	/**
	 * 处理理赔
	 */
	@Override
	public Map<String, Object> dealWithClaimDetails(ClaimDetailsDto claimDetailsDto) {
		Object obj = Global.getSessionAttribute("employee");
		if(obj == null){
			return null;
		}
		EmployeeDto employeeDto = (EmployeeDto) obj;
		Map<String, Object> map = new HashMap<String, Object>();
		claimDetailsDto.setSales_id(employeeDto.getId().toString());//登录业务员id
		// 通过
		if(claimDetailsDto.getSales_dicision() == 1){
			claimDetailsDto.setState(6);
		// 驳回
		}else if(claimDetailsDto.getSales_dicision() == 0){
			claimDetailsDto.setState(9);
		}
		salesDao.updateClaimDetails(claimDetailsDto);
		String id=claimDetailsDto.getPol_id();
		if(claimDetailsDto.getSales_dicision()==1){//业务员同意,转经理审核
			map.put("result", "1");
			Integer state=6;
			salesDao.updatePolicyStateById(id, state);//更改保单状态
		}else if(claimDetailsDto.getSales_dicision()==0){//业务员不同意,驳回
			map.put("result", "0");
			Integer state=9;//理赔未通过
			salesDao.updatePolicyStateById(id, state);//更改保单状态
		}
		if(!claimDetailsDto.getPicList().isEmpty()){
			salesDao.addPic(id, claimDetailsDto.getPicList());//添加多图
		}
		return map;
	}
	/**
	 * @desc 查看核实详情
	 * @author 陈利
	 * @date 2017年11月11日
	 */
	@Override
	public CheckDetailDto getCheckDetailDto(String id) {
		return salesDao.getCheckDetailDto(id);
	}
}
