package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReviewVO;
import org.zerock.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ReviewController {

	@Autowired
	private ReviewService service;

	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public void reviewGET(Model model, Criteria cri) {
		log.info("review...in");
		if(service.reviewList(cri).size() != 0) {
			model.addAttribute("list", service.reviewList(cri));			
			PageMaker pm = new PageMaker();
			pm.setCri(cri);
			pm.setTotal(service.totalReview(cri));
			model.addAttribute("pm", pm);
			
		}
	}

	@RequestMapping(value="/review", method=RequestMethod.POST)
	public void reviewPOST(@RequestBody ReviewVO vo, Model model) {
		System.out.println(vo);
		service.registReview(vo);
	
	}
	
}
