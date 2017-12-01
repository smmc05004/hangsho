package kr.co.hangsho.privatedeal.websocket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import kr.co.hangsho.customers.vo.Customer;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {

		ServletServerHttpRequest ssr = (ServletServerHttpRequest) request;
		HttpServletRequest httpRequest = ssr.getServletRequest();
		
		// 로그인된 사용자 정보 조회
		Map<String, Object> loginInfo = (Map<String,Object>) httpRequest.getSession().getAttribute("LOGIN_INFO");		
		if (loginInfo != null) {
			// WebSocketSession의 Attribute로 로그인한 사용자정보 저장
			Customer customer = (Customer) loginInfo.get("LOGIN_USER");
			attributes.put("LOGIN_USER_NICKNAME", customer.getNickname());
		}
		
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
}
