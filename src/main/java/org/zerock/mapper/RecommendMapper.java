package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.IRecomVO;

public interface RecommendMapper {

	public void addRecommend(List<IRecomVO> list);
	
	public void removeRecom();
}
