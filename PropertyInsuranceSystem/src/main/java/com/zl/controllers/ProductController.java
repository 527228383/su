package com.zl.controllers;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zl.dto.CommentDto;
import com.zl.dto.EmployeeDto;
import com.zl.dto.ProductDto;
import com.zl.service.ProductService;
import com.zl.util.PageUtil;
import com.zl.util.Query;
/***
 * 
 * @author 王松
 *
 * 2017年11月6日
 */
@Controller
@Scope("prototype")
@RequestMapping("/product/")
public class ProductController {
	@Resource
	private ProductService productService;
	@Autowired
	private PageUtil pageUtil;//分页工具类
	@Autowired
	private Query query;//查询条件类
	
	/**
	 * @描述 多条件分页查询
	 * @日期 2017年11月7日
	 * @操作者 彭杰
	 */
	@RequestMapping("listpro")
	public ModelAndView selectListProducts(String type,PageUtil pageUtil,String pro_name,HttpServletRequest req){
		ModelAndView mv=new ModelAndView();
		if(pageUtil.getCurrentPage()==null||"".equals(pageUtil.getCurrentPage())){
            pageUtil.setCurrentPage(1);
        }
		if(pro_name!=null && pro_name!=""){
			query.setPro_name(pro_name);
			pageUtil.setQuery(query);
		}
		pageUtil.setPageSize(6);
		pageUtil.setRowSize(productService.countProducts(query));
		List<ProductDto> products = productService.listProducts(pageUtil);
		mv.addObject("products", products);
		//type: 区分前台后台跳转 (1.服务端  2.客户端  )
		if("1".equals(type)){
			mv.setViewName("/ws/pro_main");
		}
		if("2".equals(type)){
		    mv.addObject("pro_name", pro_name);
			mv.setViewName("/Client/shop");
		}
		return mv;
	}
	
	/**
	 * @描述  根据产品ID查看产品详细信息
	 * @日期 2017年11月7日
	 * @操作者 彭杰
	 */
	@RequestMapping("getById")
	public ModelAndView selectProduct(String id){
		ModelAndView mv = new ModelAndView();
		Map<String, Integer> mag=new HashMap<String, Integer>();
		ProductDto product = productService.getProduct(id);
		List<CommentDto> listComment=productService.selectComment(id);
		mag=productService.selectNuber(id);
		if(product!=null){
		    mv.addObject("listComment", listComment);
			mv.addObject("product", product);
			mv.addObject("mag", mag);
			mv.setViewName("/Client/show");
		}else{
			mv.setViewName("/Client/error");
		}
		return mv;
	}
	
	/**
	 * 王松
	 * 根据id查询产品详情
	 * @param id
	 * @param bs 标识符  1标识查询，2表示修改
	 * @return
	 */
	@RequestMapping("selectById")
	public ModelAndView listProduct(String id){
		ModelAndView mv = new ModelAndView();
		ProductDto product = productService.getProduct(id);
		if(product!=null){
			mv.addObject("product", product);
			mv.setViewName("/ws/pro_update");
		}else{
			mv.setViewName("/Client/error");
		}
		return mv;
	}
	
	/**
	 * @描述 查看评论
	 * @日期 2017年11月7日
	 * @操作者 彭杰
	 */
	@RequestMapping("selectComment")
	public ModelAndView selectComment(String product_id){
		ModelAndView mv = new ModelAndView();
		List<CommentDto> listComment=productService.selectComment(product_id);
		mv.addObject("listComment", listComment);
		mv.setViewName("/Client/comment");
		return mv;
	}
	
	/**
	 * 添加产品
	 * 王松
	 * 2017年11月7日
	 */
	@RequestMapping("insertPro")
	public ModelAndView insertProduct(@RequestParam MultipartFile pic,ProductDto products,double[]insured_amount,double[]coverage,HttpServletRequest req){
		String path=req.getSession().getServletContext().getRealPath("/");//获取绝对路径
		path=path+"upload/";//图片保存到项目下pic目录
		if(!pic.isEmpty()){
			String picName=pic.getOriginalFilename();//获取原始文件名
			String newFileName=UUID.randomUUID().toString()+picName.substring(picName.lastIndexOf("."));//产生随机名
			File newFile=new File(path+newFileName);//建立新文件,并命名
			try {
				pic.transferTo(newFile);//复制文件
				products.setPro_pic("upload/"+newFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		
		ModelAndView mv = new ModelAndView();
			EmployeeDto emp = (EmployeeDto)req.getSession().getAttribute("employee");
			if(emp!=null){
				products.setPro_add_by(emp.getId().toString());
			}
			boolean flag = productService.insertProduct(products, insured_amount, coverage);
			if(flag){
				mv.setViewName("redirect:/product/listpro");
				mv.addObject("type","1");
				return mv;
			}
			else{
				mv.setViewName("service/index");
				return mv;
			}
	}
	

	/**
	 * 删除选中的产品
	 * 王松
	 * 2017年11月7日
	 */
	@RequestMapping("deleteProducts")
	public ModelAndView  deleteProducts(String[] ids,HttpServletRequest req,ModelAndView mv){
		Map<String,Object> map = new HashMap<String,Object>();
		List<String> list = Arrays.asList(ids);
	    EmployeeDto emp = (EmployeeDto)req.getSession().getAttribute("employee");
	    map.put("emp",emp);
	    map.put("list",list);
	    if(emp!=null){
	    	 boolean flag = productService.deleteProduct(map);
	    	 if(flag){
	 			mv.setViewName("redirect:/product/listpro");
	 			mv.addObject("type", "1");
	 		}
	    	 return mv;
	    }else{
 			mv.setViewName("service/index");
 			return mv;
 		}

	}
	

	/**
	 * 修改产品数据
	 * 王松
	 * 2017年11月7日
	 */
	@RequestMapping("updateProduct")
	public ModelAndView updateProductById(ProductDto  productDto,Double insured_amount,Double coverage,HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		EmployeeDto emp = (EmployeeDto)req.getSession().getAttribute("employee");
		if(emp!=null){
			productDto.setPro_mod_by(emp.getId().toString());
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("productDto", productDto);
		map.put("insured_amount", insured_amount);
		map.put("coverage", coverage);
		//修改数据
		boolean flag = productService.updateProduct(map);
		//跳转页面之前查询一遍
		if(flag){
			mv.setViewName("redirect:/product/listpro");
			mv.addObject("type", "1");
			return mv;
		}else{
			mv.setViewName("404");
			return mv;
		}
		
	}
}
