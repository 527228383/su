package com.zl.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


/**
 * 投保用户表
 * @author 苏建华
 *
 * 2017年11月6日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class InsureDto implements Serializable{
	
	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	private String id;  // 主键 id 
	private String ins_name;  // 投保人用户名
	private String ins_pwd; // 投保人密码
	private Integer ins_gender; // 投保人性别 (1. 男  0. 女)
	private String ins_id_card;  // 投保人身份证
	private String ins_tel;  // 投保人联系电话
	private String ins_email;  // 投保人邮箱
	private String ins_city;  // 投保人城市编号
	private String ins_city_name;//城市名称
	
	private String ins_pic; // 投保人头像
	private String ins_reg_date;  // 注册时间
	private double ins_up_date;  // 修改时间
	
}
