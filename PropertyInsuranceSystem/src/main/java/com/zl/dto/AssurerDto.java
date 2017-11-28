package com.zl.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


/**
 * 被保人用户表
 * @author 苏建华
 *
 * 2017年11月6日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class AssurerDto implements Serializable{
	
	
	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	private String id;  // 主键 id
	private String ass_name;  // 被保人用户名
	private String ass_gender;  // 被保人性别 （1. 男  0. 女）
	private String ass_id_card;  // 被保人身份证
	private String ass_tel;  // 被保人联系电话
	private String ass_email;  // 被保人邮箱
	private String ass_city;  // 被保人城市编号
	private String ass_city_name;//城市名称
	
	private String ass_add_date;  // 被保人添加时间
	
	
	
}
