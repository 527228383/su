package com.zl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.zl.dao.AreaDao;
import com.zl.dto.CityDto;
import com.zl.dto.ProvinceDto;
import com.zl.service.AreaService;

/**
 * 省市操作 service 实现类
 * @author 苏建华
 *
 * 2017年11月8日
 */
@Service
public class AreaServiceImpl implements AreaService {

	@Autowired
	private AreaDao areaDao;
	
	/** 
	 * 查询省份列表
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	@Cacheable(value = "listProvince", keyGenerator = "keyGenerator")
	public List<ProvinceDto> listProvince() {
		return areaDao.listProvince();
	}

	/** 
	 * 查询城市列表
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	@Cacheable(value = "listCity", keyGenerator = "keyGenerator")
	public List<CityDto> listCity() {
		return areaDao.listCity();
	}

	/** 
	 * 根据省份编号查询省份信息
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	public ProvinceDto getProvinceByCode(String pcode) {
		return areaDao.getProvinceByCode(pcode);
	}

	/** 
	 * 根据城市编号查询城市信息
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	public CityDto getCityByCode(String city_code) {
		return areaDao.getCityByCode(city_code);
	}

	/** 
	 * 根据省份编号查询城市列表
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	@Cacheable(value = "#privince_code", keyGenerator = "keyGenerator")
	public List<CityDto> listCityByPrivinceCode(String privince_code) {
		return areaDao.listCityByPrivinceCode(privince_code);
	}
}
