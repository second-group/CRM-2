package com.crm.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.crm.entity.Users;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		// TODO Auto-generated method stub
	/*	HttpSession session = arg0.getSession();	
		//String uri = request.getRequestURI(); // 获取登录的uri，这个是不进行拦截的		
		//if(session.getAttribute("LOGIN_USER")!=null || uri.indexOf("system/login")!=-1) {// 说明登录成功 或者 执行登录功能	
		if(session.getAttribute("LOGIN_USER")!=null) {			
			// 登录成功不拦截
			System.out.println("我进来了");
			return true;		
		}else {			
				// 拦截后进入登录页面		
			arg1.sendRedirect(arg0.getContextPath()+"/WEB-INF/login.jsp");			
			return false;		
			}
		
		}*/
		HttpSession session=arg0.getSession();
		Users LoginName=(Users) session.getAttribute("users");
		if(LoginName!=null) {
			return true;
		}else {
			arg0.getRequestDispatcher("inlogin").forward(arg0, arg1);		
		}
		
		return false;
	}

		
	

}
