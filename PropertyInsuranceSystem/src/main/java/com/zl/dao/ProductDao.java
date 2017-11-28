package com.zl.dao;

import java.util.List;
import java.util.Map;

import com.zl.dto.CommentDto;
import com.zl.dto.ProductDto;
import com.zl.dto.QuoteDto;
import com.zl.util.PageUtil;
import com.zl.util.Query;
/***
 * 
 * @author 王松
 *
 * 2017年11月6日
 */
@SuppressWarnings("rawtypes")
public interface ProductDao {


	
	/**
	 * @描述 多条件分页展示
	 * @日期 2017年11月7日
	 * @操作者 彭杰
	 */
	public List<ProductDto> listProducts(PageUtil page);
	
	/**
	 * @描述 查询一共有多少条数据
	 * @日期 2017年11月7日
	 * @操作者 彭杰
	 */
	public int countProducts(Query query);

	/**
	 * @描述  根据产品ID查询产品详细信息
	 * @日期 2017年11月7日
	 * @操作者 彭杰
	 */
	public ProductDto getProduct(String product_id);
	
	/**
	 * @描述  查看评论
	 * @日期 2017年11月7日
	 * @操作者 彭杰
	 */
	public List<CommentDto> selectComment(String product_id);
	
	/**
	 * @创建人 彭杰
	 * @创建时间 2017年11月18日
	 * @方法描述：根据传入产品的ID查询该产品评论的数量
	 */
	public int selectNumberOne(String product_id);
	public int selectNumberTwo(String product_id);
	public int selectNumber(String product_id);
	
	/**
	 * 添加产品
	 * 王松
	 * 2017年11月7日
	 */
	public int  insertProduct(ProductDto productDto);
	
	/**
	 *添加报价
	 * 王松
	 * 2017年11月7日
	 */
	int insertQuote(List<QuoteDto> quoteDtos);

	/**
	 * 删除选中所有产品
	 * 王松
	 * 2017年11月7日
	 */
	int deleteProduct(Map map);
	
	
	/**
	 * 修改产品
	 * 王松
	 * 2017年11月7日
	 */
	public int updateProduct(Map pro);
	
	
	
}
