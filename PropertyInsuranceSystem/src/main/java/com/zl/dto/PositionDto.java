package com.zl.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 职位实体类
 * @author 苏建华
 *
 * 2017年11月8日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class PositionDto implements Serializable{
	
	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;  // 主键 id
	private String pos_name;  // 职位名称
	
	
}
