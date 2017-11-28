package com.zl.dto;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

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
/**
 * @desc 投保核实实体类
 * @author 陈利
 * @date 2017年11月12日
 */
public class CheckDetailDto implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String ins_id;//订单号
	private String address;	//投保财产所在地
	private List<String> picList;//财产图片
	private String sales_des;//业务员描述
	private Integer sales_dicision;//业务员决策(是否通过: 1.表示通过 0.表示不通过)
	private Date sales_date;//业务员处理时间

}
