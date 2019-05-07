package cn.edu.nyist.food.back.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class BackInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
		
	}

	//配置后端拦截器，若进行后端管理，必须先登录才能处理本店家的业务管理，不能查看其它店家的业务管理
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		
		String requestURI=request.getRequestURI();
		if(requestURI.contains("/back")) {
			if (request.getSession().getAttribute("manager") == null) {
				if (requestURI.endsWith("/toLogin") || requestURI.endsWith("/login") || requestURI.endsWith("/vcode.png")) {

					return true;
				}
				// 如果没有登录，请求其他，我们将先转到登录界面
				response.sendRedirect(request.getContextPath()+"/back/toLogin");
				return false;
			}
		}
		
		return true;
	}
	
	
}
