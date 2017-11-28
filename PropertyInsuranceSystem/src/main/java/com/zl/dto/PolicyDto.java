package com.zl.dto;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @desc 保单实体类
 * @author 陈利
 * @date 2017年11月7日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class PolicyDto implements Serializable{
	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	private String id;//保单号
	private InsureDto insureDto;//投保人(一对一关联b_ins_id)
	private AssurerDto assurerDto;//被保人(一对一关联b_ass_id)
	private ProductDto productDto;//产品(一对一关联b_pro_id)
	private QuoteDto quote;//购买以及理赔金额
	private Double b_coverage;//保险费
	private Double b_insured_amount;//赔付金额
	private Date b_effect_date;//生效时间
	private Date b_lose_date;//失效时间
	private Integer b_state_id;//保单状态
	private String b_state;//保单状态名(后台描述用)
	private Integer b_count;//理赔次数
	private Integer b_com_mark;//评论状态
	
	
}
