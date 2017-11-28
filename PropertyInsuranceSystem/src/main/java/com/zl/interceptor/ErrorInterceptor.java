package com.zl.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 错误页面拦截器
 * @author 苏建华
 *
 * 2017年11月8日
 */
@Controller
public class ErrorInterceptor implements HandlerInterceptor {

	/** 
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	/** 
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res,
			Object arg2, ModelAndView modelAndView) throws Exception {
		if(modelAndView == null){
			modelAndView = new ModelAndView();
		}
		if(res.getStatus()==500){  
            modelAndView.setViewName("redirect:/jsp/500.jsp");  
        }else if(res.getStatus()==404){  
            modelAndView.setViewName("redirect:/jsp/404.jsp");  
        } 
	}

	/** 
	 * 苏建华
	 * 2017年11月8日
	 */
	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		return true;
	}

}
