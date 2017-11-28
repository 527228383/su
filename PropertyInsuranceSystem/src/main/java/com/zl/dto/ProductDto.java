package com.zl.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
/**
 * 产品实体类
 * @author 王松
 *
 * 2017年11月6日
 */


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ProductDto implements Serializable {
	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	//主键ID
	private String  id;
	//产品名称
	private String  pro_name;
	//保障项目
	private String  pro_program;
	//保障范围
	private String  pro_scope;
	//发布人
	private String  pro_add_by;
	//发布时间
	private Date    pro_add_date;
	//修改人
	private String  pro_mod_by;
	//修改时间
	private Date    pro_mod_date;
	//删除人
	private String  pro_del_by;
	//删除时间
	private Date    pro_del_date;
	//删除标记
	private Integer pro_del_mark;
	//保障期限
	private Integer pro_time;
	
	//产品图片
	private String pro_pic;
	//产品报价list集合
	private List<QuoteDto> pro_quote;
	
}
