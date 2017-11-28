package com.zl.service;

import java.util.List;
import java.util.Map;

import com.zl.dto.CommentDto;
import com.zl.dto.ProductDto;
import com.zl.util.PageUtil;
import com.zl.util.Query;
/***
 * 
 * @author 王松
 *
 * 2017年11月6日
 */
@SuppressWarnings("rawtypes")
public interface ProductService {
		
		/**
		 * @描述 多条件分页查询
		 * @日期 2017年11月7日
		 * @操作者 彭杰
		 */
		List<ProductDto> listProducts(PageUtil page);
		
		/**
		 * @描述 查询一共有多少条数据
		 * @日期 2017年11月7日
		 * @操作者 彭杰
		 */
		int countProducts(Query query);
		
		/**
		 * @描述 根据产品ID查询产品详细信息
		 * @日期 2017年11月7日
		 * @操作者 彭杰
		 */
		ProductDto getProduct(String id);
		
		/**
		 * @描述  查看评论
		 * @日期 2017年11月7日
		 * @操作者 彭杰
		 */
		public List<CommentDto> selectComment(String product_id);
		
		
		/**
		 * @创建人 彭杰
		 * @创建时间 2017年11月18日
		 * @方法描述：查询
		 */
		public Map<String,Integer> selectNuber(String product_id);

		
		/**
		 * 添加产品
		 * 王松
		 * 2017年11月7日
		 */
		boolean insertProduct(ProductDto productDto,double[]insured_amount,double[]coverage);
		
		
		
		
		
		
		/**
		 * 删除所有产品
		 * 王松
		 * 2017年11月7日
		 */
		boolean deleteProduct(Map map);
		
		/**
		 * 修改产品
		 * 王松
		 * 2017年11月7日
		 */
		public boolean updateProduct(Map pro);

}
