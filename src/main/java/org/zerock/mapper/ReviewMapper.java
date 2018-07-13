package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ReviewVO;

public interface ReviewMapper {
	
	public void insertReview(ReviewVO vo);
	
	public List<ReviewVO> listReviews();

	public void deleteReview(int vno);
}
