package kr.co.hangsho.products.service;

import java.util.List;
import java.util.Map;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.products.vo.ProductAns;
import kr.co.hangsho.products.vo.ProductQue;
import kr.co.hangsho.web.criteria.Criteria;

public interface ProductQueService {

	void addProductQue(ProductQue productQue);
	List<ProductQue> getAllProductQues();
	ProductQue getProductQueContent(int id);
	List<ProductQue> getProductQuesByCustomer(Customer customer);
	List<ProductQue> getProductQuess(Criteria criteria);
	int getTotalRows(Criteria criteria);
	
	List<ProductQue> getProductQuessByComapnyId(Map<String, Object> map);
	int getTotalRowsByCompanyId(Map<String, Object> map);
	ProductQue getProductQueById(int id);
	void updateProductQue(ProductQue productQue);
	List<ProductQue> getProductQuessForIndex(int companyId);
	
	List<ProductQue> getProductQuessByProductId(Map<String, Object> map);
	int getTotalRowsByProductId(Map<String, Object> map);
	
}
