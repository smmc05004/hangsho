package kr.co.hangsho.products.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.products.mappers.ProductAnsMapper;
import kr.co.hangsho.products.vo.ProductAns;
import kr.co.hangsho.web.criteria.Criteria;

@Service
public class ProductAnsServiceImpl implements ProductAnsService{

	@Autowired
	ProductAnsMapper productAnsMapper;
	
	@Override
	public void addProductAns(ProductAns productAns) {
		int seq = productAnsMapper.getSeq();
		productAns.setId(seq);
		
		productAnsMapper.addProductAns(productAns);
	}
	
	@Override
	public List<ProductAns> getAllProductAns() {
		return productAnsMapper.getProductAns();
	}
	
	@Override
	public ProductAns getProductAnsByProQueId(int proqueId) {
		return productAnsMapper.getProductAnsByProQueId(proqueId);
	}
	
	@Override
	public List<ProductAns> getProductAnss(Criteria criteria) {
		return productAnsMapper.getProductAnss(criteria);
	}
	
	@Override
	public int getTotalRows(Criteria criteria) {
		return productAnsMapper.getTotalRows(criteria);
	}

	@Override
	public ProductAns getProductAnswerByQuestionId(int questionId) {
		return productAnsMapper.getProductAnswerByQuestionId(questionId);
	}
}
