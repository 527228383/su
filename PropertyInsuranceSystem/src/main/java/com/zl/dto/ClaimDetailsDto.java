package com.zl.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 理赔业务类
 * @author 苏建华
 *
 * 2017年11月8日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ClaimDetailsDto implements Serializable{
	
	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	private String id; // 主键 id
	private InsureDto insureDto;  // 投保人
	private AssurerDto assurerDto; // 被保人
	private String pol_id;  // 保单号
	private String pro_name;  // 保险名称
	private Date expirationDate; // 保单到期时间
	private double b_coverage;  // 购买价格
	private double b_insured_amount; // 赔付金额
	private String address; // 事故发生地点
	private Date accident_date; // 事故发生时间
	private String accident_des; // 事故描述
	private List<String> picList; // 现场照片(多图)
	private String sales_id; //业务员 id
	private String sales_name; //业务员名字
	private String sales_idea; // 业务员的意见
	private Integer sales_dicision; // 业务员决策(是否通过: 1.表示通过 0.表示不通过)
	private Date sales_date; // 业务员处理时间
	private String mgr_id; // 经理 id
	private String mgr_name; // 经理名字
	private String mgr_idea; // 经理的意见
	private Integer mgr_dicision; // 经理的决策(是否通过: 1.表示通过 0.表示不通过)
	private Date mgr_date; // 经理处理时间
	private String admin_id; // 管理员 id
	private String admin_name; // 管理员名字
	private String admin_idea; // 管理员的意见
	private Integer admin_dicision; // 管理员的决策(是否通过: 1.表示通过 0.表示不通过)
	private Date admin_date; // 管理员处理时间
	private Integer state;  // 理赔状态
	private String processId; // 流程实例id 
	private Integer b_state_id; // 状态id
	private String b_state; // 状态名
	
}
