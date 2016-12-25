package com.fxb.breakfast.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
	  System.out.println("============µÇÂ¼ÅÐ¶Ï");
		// TODO Auto-generated method stub
		   HttpServletRequest httpRequest=(HttpServletRequest)request;
		   HttpServletResponse httpResponse=(HttpServletResponse)response;
		   HttpSession session=httpRequest.getSession();
		   System.out.println("=================="+session.getAttribute("userId"));
		   if(session.getAttribute("userId") == null){
			   httpResponse.sendRedirect("login.jsp");
		   }else{
			   chain.doFilter(request, response);
		   }
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
