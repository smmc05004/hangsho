package kr.co.hangsho.products.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.orders.vo.Order;
import kr.co.hangsho.products.mappers.ProductDetailMapper;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.products.vo.ProductDetail;

@Service
public class ProductDetailServiceImpl implements ProductDetailService{

	@Autowired
	ProductDetailMapper mapper;
	
	@Override
	public List<ProductDetail> getAllProductDetails() {
		return mapper.getProductDetails();
	}

	@Override
	public List<ProductDetail> getProductDetailsByProduct(Product product) {
		return mapper.getProductDetailsByProduct(product);
	}

	@Override
	public ProductDetail getProductDetailById(int id) {
		return mapper.getProductDetail(id);
	}

	@Override
	public List<ProductDetail> getProductDetailsByOrder(Order order) {
		return mapper.getProductDetailsByOrder(order);
	}

	@Override
	public List<ProductDetail> getProductDetailsByCustomer(Customer customer) {
		return mapper.getProductDetailsByCustomer(customer);
	}	

}
