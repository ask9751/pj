package org.zerock.security;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	private MemberService mservice;
	
	public CustomLoginSuccessHandler() {
		
	}
	
	public CustomLoginSuccessHandler(String defaultTargetUrl) {
		setDefaultTargetUrl(defaultTargetUrl);
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		String mid = request.getParameter("mid");
		String favor = mservice.getUserID(mid).getFavor();
		System.out.println("추천 리스트 : " + mservice.recommendMovie(favor));
		
		HttpSession session = request.getSession();		
		session.setAttribute("favor", mservice.recommendMovie(favor));
		
		if (session != null) {
			String redirectUrl = (String)session.getAttribute("prevPage");
			
//			System.out.println("핸들러 이전 페이지 URL............................" + redirectUrl);
			
			if (redirectUrl != null) {
				session.removeAttribute("prevPage");
				getRedirectStrategy().sendRedirect(request, response, redirectUrl);
			} else {
				super.onAuthenticationSuccess(request, response, authentication);
			}
		} else {
			super.onAuthenticationSuccess(request, response, authentication);
		}
	}

}
