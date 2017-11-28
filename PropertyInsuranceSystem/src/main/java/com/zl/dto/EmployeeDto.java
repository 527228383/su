package com.zl.dto;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 员工类
 * @author 苏建华
 *
 * 2017年11月6日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class EmployeeDto implements Serializable{
	
	/**
	 * 苏建华
	 * 2017年11月10日
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;  // 主键 id
	
	private String emp_name;  // 员工姓名
	
	private String emp_pwd;  //密码
	
	private String emp_gender;  // 性别
	
	private Integer emp_age;  // 年龄
	
	private Date emp_birthday;  //出生日期
	
	private String emp_id_card;  // 省份证
	
	private String emp_address;  // 户籍地址
	
	private Date emp_hiredate;  // 入职日期
	
	private String emp_position_id;  //职位编号
	
	private String position_name;  // 职位名称
	
	private Integer emp_province_id;  // 省份 id
	
	private String province_name;  // 省份名称
	
	private Integer emp_city_id;  // 城市 id
	
	private String city_name;  //城市名称
	
	private String emp_leader_id;  // 领导编号
	
	private String leader_name;  // 领导名称
	
	private String emp_add_people;  // 添加人 id
	
	private String add_people_name;  //添加人名字
	
	private Date emp_add_date;  // 添加时间
	
	private String emp_up_people;  // 更新人 id
	
	private String up_people_name;  // 更新人名字
	
	private Date emp_up_date; // 更新时间
	
	private String emp_del_people;  //  删除人 id
	
	private String del_people_name;  // 删除人名字
	
	private Date emp_del_date;  //  删除时间
	
	private Integer emp_del_mark;  //是否删除(0表示删除， 1表示未删除)
	
	private Integer business; // 业务
	
}
