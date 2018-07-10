package org.zerock.controller;

import java.io.IOException;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.service.IndexService;
import org.zerock.service.MemberService;

@Controller
public class IndexController {

	@Autowired
	private IndexService service;
	
	@Autowired
	private MemberService mservice;
	
	@GetMapping("/index")
	public void index(Model model, Principal prin) throws IOException {
		
		if(prin != null) {
			System.out.println("index 컨트롤러 / prin.............................................." + prin);
		model.addAttribute("favor", mservice
							.recommendMovie(mservice.getUserID(prin.getName()).getFavor()));
		model.addAttribute("prin",prin.getName());
		}
		
		model.addAttribute("week", service.weekList());
		model.addAttribute("month", service.monthList());
		model.addAttribute("year", service.yearList());
	
	}
}
