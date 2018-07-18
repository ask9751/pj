package org.zerock.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.security.UserDetailsServiceImpl;
import org.zerock.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login(@RequestParam(value="error", required=false)String error,
					@RequestParam(value="logout", required = false)String logout, HttpServletRequest request
					,HttpSession session) {
		
		ModelAndView model = new ModelAndView();
		
		String currentUrl = request.getRequestURL().toString();
		
		System.out.println(currentUrl);
			
		String referrer = request.getHeader("Referer");
		
		System.out.println("로그인 컨트롤러 이전 페이지.........................................." + referrer);
		
		if(referrer == null) {
			referrer = "http://localhost:8080/index";
		}

		if(!referrer.equals("http://localhost:8080/signup") && error == null) { 
			//이전페이지가 회원가입 페이지가 아니고 에러가 없을 경우에만 prevPage에 주소를 담아준다
			
			request.getSession().setAttribute("prevPage", referrer);
			System.out.println("referrer..........................." + referrer);
		}

		
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		

		model.setViewName("login");
		return model;
	}
	
	@GetMapping("/signup")
	public void signUp(HttpServletRequest request) {

		String referrer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referrer);
		System.out.println("회원가입 페이지 이전페이지 저장 URL................................" + referrer);
	}

	@PostMapping("/signup")
	public void signUpPost(MemberVO vo, Model model, RedirectAttributes rttr, HttpSession session,
			HttpServletResponse res) throws Exception {
		
		vo.setMpw(UserDetailsServiceImpl.encoder(vo.getMpw()));
		service.userRegist(vo);
		service.insertAuth(vo.getMid());
		
		
		service.getUserID(vo.getMid());
		session.setAttribute("LOGIN", vo);
		


		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		out.println("<script>alert('회원가입되었습니다'); location.href='/login' </script>");

		
	}

	@PostMapping("/idCheck")
	public ResponseEntity<String> checkId(@RequestBody String id) {
		ResponseEntity<String> entity = null;
		entity = new ResponseEntity<String>(Integer.toString(service.userIdCheck(id)), HttpStatus.OK);	
		return entity;
	}

}
