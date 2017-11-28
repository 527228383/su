package com.zl.dao;

import java.util.List;

import com.zl.dto.CityDto;
import com.zl.dto.ProvinceDto;

/**
 * 省市操作 dao 层
 * @author 苏建华
 *
 * 2017年11月8日
 */
public interface AreaDao {
	
	
	/**
	 * 查询省份列表
	 * 苏建华
	 * 2017年11月8日
	 */
	List<ProvinceDto> listProvince();
	
	/**
	 * 根据省份编号查询省份信息
	 * 苏建华
	 * 2017年11月8日
	 */
	ProvinceDto getProvinceByCode(String pcode);
	
	/**
	 * 查询城市列表
	 * 苏建华
	 * 2017年11月8日
	 */
	List<CityDto> listCity();
	
	/**
	 * 根据城市编号查询城市信息
	 * 苏建华
	 * 2017年11月8日
	 */
	CityDto getCityByCode(String city_code);
	
	/**
	 * 根据省份编号查询城市列表
	 * 苏建华
	 * 2017年11月8日
	 */
	List<CityDto> listCityByPrivinceCode(String privince_code);
}
