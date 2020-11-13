package com.dolbommon.dbmon.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ManagerLoginInterceptor extends HandlerInterceptorAdapter {

	/*
	 관리자 페이지 로그인 인터셉터
	  
	*/
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		String managerStatus = (String)session.getAttribute("managerStatus"); 
		if(managerStatus == null || managerStatus != "Y") {
			response.sendRedirect(request.getContextPath()+"/managerLogin");
			return false;
		}
		
		
		return true;
	}

}
