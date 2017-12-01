package kr.co.hangsho.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.review.mappers.ReviewMapper;
import kr.co.hangsho.review.vo.Review;

@Service
public class ReviewServiceImple implements ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public List<Review> getReviewsByProductId(int proId) {
		return null;
	}

	@Override
	public List<Review> getReviewsByMap(Map<String, Object> map) {
		return reviewMapper.getReviewsByMap(map);
	}

	@Override
	public int getTotalRowsByMap(Map<String, Object> map) {
		return reviewMapper.getTotalRowsByMap(map);
	}

	@Override
	public List<Review> getReviewsForIndex(int companyId) {
		return reviewMapper.getReviewsForIndex(companyId);
	}
	
	@Override
	public List<Review> getRivewsByProIdMap(Map<String, Object> map) {
		return reviewMapper.getRivewsByProIdMap(map);
	}
	
	@Override
	public int getTotalRowsByProIdMap(Map<String, Object> map) {
		return reviewMapper.getTotalRowsByProIdMap(map);
	}

}
