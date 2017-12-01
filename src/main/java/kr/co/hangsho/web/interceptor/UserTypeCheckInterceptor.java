package kr.co.hangsho.web.interceptor;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserTypeCheckInterceptor extends HandlerInterceptorAdapter{

	private Set<String> customerUrlSets;
	private Set<String> companyUrlSets;
	public void setCustomerUrlSets(Set<String> customerUrlSets) {
		this.customerUrlSets = customerUrlSets;
	}
	public void setCompanyUrlSets(Set<String> companyUrlSets) {
		this.companyUrlSets = companyUrlSets;
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURI = request.getRequestURI();
		
		if(customerUrlSets.contains(requestURI)) {
		Map<String, Object>loginInfo = (Map) request.getSession().getAttribute("LOGIN_INFO");
		String userType = (String) loginInfo.get("USER_TYPE");
			if("CUSTOMER".equals(userType)) {
				return true;
			}
			else {
				response.sendError(404);
				return false;
			}
		} else if(companyUrlSets.contains(requestURI)) {
			Map<String, Object>loginInfo = (Map) request.getSession().getAttribute("LOGIN_INFO");
			String userType = (String) loginInfo.get("USER_TYPE");
			if("COMPANY".equals(userType)) {
				return true;
			} else {
				response.sendError(404);
				return false;
			}
		}
		else
			return true;
	}
}
