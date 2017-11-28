package com.zl.dto;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


/**
 * @author 尚奔科
 *	评论实体类
 * 2017年11月7日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class CommentDto implements Serializable{
	

	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	private String id;//评论id
	private String product_id;//评论保险产品id
	private String ins_id;//投保人id
	private String content;//投保人评论
	private Date com_date;//评论日期
	private Integer grade;//用户评分
	
	
}
