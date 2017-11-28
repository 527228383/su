package com.zl.dto;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @desc 订单实体类
 * @author 陈利
 * @date 2017年11月8日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class OrderDto implements Serializable{
	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	private String id;//订单号
	private InsureDto insureDto;//投保人(一对一关联d_ins_id)
	private AssurerDto assurerDto;//被保人(一对一关联d_ass_id)
	private ProductDto productDto;//产品(一对一关联d_pro_id)
	private String d_pro_id;//产品id
	private Double d_coverage;//保险费
	private Double d_insured_amount;//赔付金额
	private Date d_add_date;//提交时间
	private Date d_pay_date;//支付时间
	private Integer d_state_id;//订单状态
	
	
}
