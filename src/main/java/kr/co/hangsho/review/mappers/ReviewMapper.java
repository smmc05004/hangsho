package kr.co.hangsho.review.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.review.vo.Review;

@Mapper
public interface ReviewMapper {

	List<Review> getReviewsByProductId(int proId);
	List<Review> getReviewsByMap(Map<String, Object> map);
	int getTotalRowsByMap(Map<String, Object> map);
	List<Review> getReviewsForIndex(int companyId);
	
	// 상품 상세페이지 구매후기 리스트 출력 + 페이징
	List<Review> getRivewsByProIdMap(Map<String, Object> map);
	int getTotalRowsByProIdMap(Map<String, Object> map);
	
}
