package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SearchResult;
import org.zerock.utils.SearchAPI;

@RestController
@RequestMapping("/reviews")
public class ReviewRESTController {

	@RequestMapping(value = "/{keyword}", method = RequestMethod.GET)
	public ResponseEntity<List<SearchResult>> 
		listMovies(@PathVariable("keyword") String keyword) {

		ResponseEntity<List<SearchResult>> entity = null;		
		try {
			List<SearchResult> list = null;
			list = SearchAPI.searchMovie(keyword);
			
			entity = new ResponseEntity<List<SearchResult>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.getMessage();
		}
		return entity;
	}
}
