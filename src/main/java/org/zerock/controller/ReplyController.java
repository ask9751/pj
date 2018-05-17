package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.Setter;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	
	@Setter(onMethod_= {@Autowired})
	private ReplyService service;
	
	
	
	@PostMapping("/new")
	public void register() {
		
	}
	
	@ResponseBody
	@RequestMapping(value="/{bno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> listReplies(@PathVariable("bno")int bno,
			@PathVariable("page")int page) {
		Criteria cri = new Criteria();
		System.out.println("list Reply come in....................................");
		Map<String,Object> map = new HashMap<>();
		
		map.put("bno", bno);
		map.put("cri", cri);
		
		
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<List<ReplyVO>>(service.listReplies(map), HttpStatus.OK);
			System.out.println("=================================="+service.listReplies(map));
		}catch(Exception e) {
			e.getMessage();
		}
		return entity;
		
	}
	
	@PutMapping("/{bno}/{rno}")
	public void updateReplies() {
		
	}
	
	@DeleteMapping("/{bno}/{rno}")
	public void removeReplies() {
		
	}
}
