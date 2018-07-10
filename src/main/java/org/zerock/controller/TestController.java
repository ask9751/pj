package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/test/*")
@Controller
public class TestController {
	
	@GetMapping("/search")
	public void search() {
		System.out.println("search Get................");
	}

}
