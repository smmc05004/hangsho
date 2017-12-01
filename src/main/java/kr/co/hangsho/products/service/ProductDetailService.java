package kr.co.hangsho.products.service;

import java.util.List;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.orders.vo.Order;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.products.vo.ProductDetail;

public interface ProductDetailService {

	List<ProductDetail> getAllProductDetails();
	List<ProductDetail> getProductDetailsByProduct(Product product);
	List<ProductDetail> getProductDetailsByOrder(Order order);
	List<ProductDetail> getProductDetailsByCustomer(Customer customer);
	ProductDetail getProductDetailById(int id);
}
