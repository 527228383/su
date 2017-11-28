package com.zl.util;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import org.springframework.stereotype.Component;


/**
 * 模糊查询条件类
 * @author 苏建华
 *
 * 2017年11月6日
 */
/**
 * @author 尚奔科
 *
 * 2017年11月10日
 */
/**
 * @author 尚奔科
 *
 * 2017年11月10日
 */
@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class Query implements Serializable{
	
	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	/**
	 *@注释 产品名称
	 *@添加人 彭杰
	 */
	private String pro_name;
	/**
	 *@注释 员工编号
	 *@添加人 苏建华
	 */
	private Integer emp_id;
	/**
	 *@注释 员工名字
	 *@添加人 苏建华
	 */
	private String emp_name;
	/**
	 *@注释 员工职位
	 *@添加人 苏建华
	 */
	private String pos_name;
	/**
	 *@注释 起始查询时间
	 *@添加人 苏建华
	 */
	private Date startDate;
	/**
	 *@注释 结束查询时间
	 *@添加人 苏建华
	 */
	private Date endDate;
	
	/**
	 * 保单号
	 * @添加人 苏建华
	 */
	private String pol_id;
	/**
	 * 订单号
	 * @添加人 陈利
	 */
	private String order_id;
	/**
	 * 订单/保单 状态起始位置
	 * @添加人 陈利
	 */
	private Integer start_state_id;
	/**
	 * 订单/保单 状态结束位置
	 * @添加人 陈利
	 */
	private Integer end_state_id;
	/**
	 * 产品ID
	 * @添加人 陈利
	 */
	private String pro_id;
	
	/**
	 * 被保人姓名
	 */
	private String ass_name;
	
	/**
	 * 订单状态
	 */
	
	//查询条件
	private String time_mark;

	
	
	private String typeid;
	
	//状态标识数组
	private List<String> states;

}
