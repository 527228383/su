package com.zl.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 获取 HttpServletRequest 以及 HttpSession
 *
 * @author 苏建华
 * 2017年11月12日
 */
public class Global {
	
	/**
	 * 获取当前请求 HttpServletRequest
	 *
	 * @author 苏建华
	 * 2017年11月12日
	 */
	public static HttpServletRequest getRequest(){
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
					.getRequestAttributes())
					.getRequest();
		return request;
	}
	
	
	
	/**
	 * 获取当前请求的 HttpSession
	 *
	 * @author 苏建华
	 * 2017年11月12日
	 */
	public static HttpSession getHttpSession(){
		return getRequest().getSession();
	}
	
	public static String getRealRootPath(){  
        return getRequest().getServletContext().getRealPath("/");  
    }
	
	public static Object getSessionAttribute(String name){  
        HttpServletRequest request = getRequest();  
        return request == null?null:request.getSession().getAttribute(name);  
    }
	
	public static void setSessionAttribute(String name,Object value){  
        HttpServletRequest request = getRequest();  
        if(request!=null){  
            request.getSession().setAttribute(name, value);   
        }  
    }
	
	public static Object getRequestAttribute(String name){  
        HttpServletRequest request = getRequest();  
        return request == null?null:request.getAttribute(name);  
    }
	
	public static void setRequestAttribute(String name,Object value){  
        HttpServletRequest request = getRequest();  
        if(request!=null){  
            request.setAttribute(name, value);    
        }  
    }
	
	public static void removeSessionAttribute(String name) {  
        getRequest().getSession().removeAttribute(name);  
    }
	
}
