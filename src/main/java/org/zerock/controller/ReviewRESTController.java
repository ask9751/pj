package org.zerock.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ReviewVO;

@RestController
@RequestMapping("/reviews")
public class ReviewRESTController {

	@RequestMapping(value = "/{keyword}/", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> 
			listReplies(@PathVariable("keyword") String bno) {

		ResponseEntity<String> entity = null;
		try {

			entity = new ResponseEntity<String>("등록되었습니다", HttpStatus.OK);
		} catch (Exception e) {
			e.getMessage();
		}
		return entity;
	}
}
