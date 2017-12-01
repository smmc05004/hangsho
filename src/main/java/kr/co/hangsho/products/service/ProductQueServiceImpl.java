package kr.co.hangsho.products.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.products.mappers.ProductQueMapper;
import kr.co.hangsho.products.vo.ProductQue;
import kr.co.hangsho.web.criteria.Criteria;

@Service
public class ProductQueServiceImpl implements ProductQueService {

	@Autowired
	ProductQueMapper productQueMapper;
	
	@Override
	public void addProductQue(ProductQue productQue) {
		int seq = productQueMapper.getSeq();
		productQue.setId(seq);
		
		productQueMapper.addProductQue(productQue);
	}
	
	@Override
	public List<ProductQue> getAllProductQues() {
		return productQueMapper.getProductQues();
	}
	
	@Override
	public ProductQue getProductQueContent(int id) {
		return productQueMapper.getProductQueById(id);
	}
	
	@Override
	public int getTotalRows(Criteria criteria) {
		return productQueMapper.getTotalRows(criteria);
	}
	
	@Override
	public List<ProductQue> getProductQuess(Criteria criteria) {
		return productQueMapper.getProductQuess(criteria);
	}

	@Override
	public List<ProductQue> getProductQuesByCustomer(Customer customer) {
		return productQueMapper.getProductQuesByCustomer(customer);
	}
	
	@Override
	public List<ProductQue> getProductQuessByComapnyId(Map<String, Object> map) {
		return productQueMapper.getProductQuessByComapnyId(map);
	}
	@Override
	public int getTotalRowsByCompanyId(Map<String, Object> map) {
		return productQueMapper.getTotalRowsByCompanyId(map);
	}

	@Override
	public ProductQue getProductQueById(int id) {
		return productQueMapper.getProductQueById(id);
	}

	@Override
	public void updateProductQue(ProductQue productQue) {
		productQueMapper.updateProductQue(productQue);
		
	}

	@Override
	public List<ProductQue> getProductQuessForIndex(int companyId) {
		return productQueMapper.getProductQuessForIndex(companyId);
	}
	
	@Override
	public List<ProductQue> getProductQuessByProductId(Map<String, Object> map) {
		return productQueMapper.getProductQuessByProductId(map);
	}
	
	@Override
	public int getTotalRowsByProductId(Map<String, Object> map) {
		return productQueMapper.getTotalRowsByProductId(map);
	}

}
