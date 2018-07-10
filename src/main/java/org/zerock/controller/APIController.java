package org.zerock.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.utils.SearchAPI;

@RestController
@RequestMapping("/api/*")
public class APIController {

	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void searchMovie() {
		System.out.println("search Get.................................");
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public void searchMoviePost(@Param("query") String query, Model model) {

		model.addAttribute("searchResult", SearchAPI.searchMovie(query));
		System.out.println("search Post.......................");
	}
}
