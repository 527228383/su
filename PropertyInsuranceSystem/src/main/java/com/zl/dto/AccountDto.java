package com.zl.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class AccountDto implements Serializable{
	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	private String id; // 主键
	private double balance; // 余额
	private double discount;  // 优惠券
	private String ins_id;  // 用户 id 
}
