package com.zl.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 城市类
 * @author 苏建华
 *
 * 2017年11月8日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class CityDto implements Serializable{
	
	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;  // 主键 id
	private String city_code; // 城市编号
	private String city_name;  // 城市名称 
	private Integer province_code;  // 省份编号
	
	
	
}
