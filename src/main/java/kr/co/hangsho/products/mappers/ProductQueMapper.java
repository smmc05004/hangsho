package kr.co.hangsho.products.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.products.vo.ProductAns;
import kr.co.hangsho.products.vo.ProductQue;
import kr.co.hangsho.web.criteria.Criteria;

@Mapper
public interface ProductQueMapper {

	int getSeq();
	void addProductQue(ProductQue productQue);
	List<ProductQue> getProductQues();
	List<ProductQue> getProductQuesByCustomer(Customer customer);
	ProductQue getProductQueById(int id);	// 상품문의 하나에 해당하는 내용 하나 가져오기
	// 페이징 처리
	List<ProductQue> getProductQuess(Criteria criteria);
	int getTotalRows(Criteria criteria);
	List<ProductQue> getProductQuessByComapnyId(Map<String, Object> map);
	int getTotalRowsByCompanyId(Map<String, Object> map);
	void updateProductQue(ProductQue productQue);
	List<ProductQue> getProductQuessForIndex(int companyId);
	
	// 상품번호로 상품문의 리스트 출력
	List<ProductQue> getProductQuessByProductId(Map<String, Object> map);
	int getTotalRowsByProductId(Map<String, Object> map);
	
}
