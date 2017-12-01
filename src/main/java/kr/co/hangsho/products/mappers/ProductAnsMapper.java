package kr.co.hangsho.products.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.products.vo.ProductAns;
import kr.co.hangsho.products.vo.ProductQue;
import kr.co.hangsho.web.criteria.Criteria;

@Mapper
public interface ProductAnsMapper {

	int getSeq();
	void addProductAns(ProductAns productAns);
	List<ProductAns> getProductAns();
	ProductAns getProductAnsByProQueId(int proqueId);	// 상품문의 하나에 해당하는 판매자답변 가져오기
	
	// 페이징 처리
	int getTotalRows(Criteria criteria);
	List<ProductAns> getProductAnss(Criteria criteria);
	ProductAns getProductAnswerByQuestionId(int questionId);
}
