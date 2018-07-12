package org.zerock.service;

import java.util.List;

import org.zerock.domain.ReviewVO;

public interface ReviewService {
	
	public void registReview(ReviewVO vo);
	
	public List<ReviewVO> reviewList();

}
