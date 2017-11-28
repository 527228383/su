package com.zl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zl.dao.ProductDao;
import com.zl.dto.CommentDto;
import com.zl.dto.ProductDto;
import com.zl.dto.QuoteDto;
import com.zl.service.ProductService;
import com.zl.util.PageUtil;
import com.zl.util.Query;
/***
 * service实现类
 * @author 王松
 *
 * 2017年11月6日
 */
/**
 * @author 王松
 *
 * 2017年11月7日
 */
@Service
@SuppressWarnings("all")
public class ProductServiceImpl implements ProductService {
	@Resource
	private ProductDao productDao;
	
	/** 
	 *@重写方法
	 *@操作者 彭杰
	 *@描述  多条件分页展示
	 */
	@Override
	public List<ProductDto> listProducts(PageUtil page) {
		
		return productDao.listProducts(page);
	}
	
	/** 
	 *@重写方法
	 *@操作者 彭杰
	 *@描述  查询一共有多少条数据
	 */
	@Override
	public int countProducts(Query query) {
		
		int num= productDao.countProducts(query);
		return num;
	}
	
	
	/** 
	 *@重写方法
	 *@操作者 彭杰
	 *@描述  根据ID查询产品详情
	 */
	@Override
	public ProductDto getProduct(String product_id) {
		
		return productDao.getProduct(product_id);
	}
	
	/** 
	 *@重写方法
	 *@操作者 彭杰
	 *@描述   查看产品评论
	 */
	@Override
	public List<CommentDto> selectComment(String id) {
		
		return productDao.selectComment(id);
	}

	  @Override
	    public Map<String, Integer> selectNuber(String product_id) {
	        Map<String,Integer> mag=new HashMap<String,Integer>();
	       int x= productDao.selectNumber(product_id);
	       int y= productDao.selectNumberOne(product_id);
	       int z= productDao.selectNumberTwo(product_id);
	       mag.put("one",x);
	       mag.put("two",y);
	       mag.put("three",z);
	        return mag;
	    }
	
	/**
	 * 删除选中的产品
	 * 王松
	 * 2017年11月7日
	 */
	@Override
	public boolean deleteProduct(Map map) {
		int i = productDao.deleteProduct(map);
		if(i>0){
			return true;
		}else {
			return false;
		}
	}
	
	
	/**
	 * 修改产品
	 * 王松
	 * 2017年11月7日
	 */
	@Override
	public boolean updateProduct(Map pro) {
		int i = productDao.updateProduct(pro);
		if(i>0){
			return true;
		}else {
			return false;
		}
	}

	
	/**
	 * 添加产品
	 * 王松
	 * 2017年11月7日
	 */
	@Override
	public boolean insertProduct(ProductDto productDto,
			double[] insured_amount, double[] coverage) {
		//执行产品插入
		int m = productDao.insertProduct(productDto);
		
		//取出产品的ID 作为添加报价的参数
		String proId = productDto.getId();
		//int n=0 ;
		//从数组里循环取值，并封装
		List ls=new ArrayList();
		for(int i=0;i<insured_amount.length;i++){
			QuoteDto quoteDto = new QuoteDto();
			quoteDto.setPro_id(proId);
			quoteDto.setCoverage(coverage[i]);
			quoteDto.setInsured_amount(insured_amount[i]);
			ls.add(quoteDto);	
		}
		
		int n = productDao.insertQuote(ls);
		if(m>0&&n>0){
			return true;
		}else{
			return false;
		}
		
	}

}
