package com.zl.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 尚奔科
 * 保险产品报价
 * 2017年11月7日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class QuoteDto implements Serializable{
	
	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	private String id;//主键id
	private String pro_id;//产品id
	private Double insured_amount;//保额，即保险事故赔付的钱
	private Double coverage;//保费，买保险话费的钱
	

}
