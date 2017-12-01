package kr.co.hangsho.products.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.orders.vo.Order;
import kr.co.hangsho.products.vo.Product;
import kr.co.hangsho.products.vo.ProductDetail;

@Mapper
public interface ProductDetailMapper {

	List<ProductDetail> getProductDetails();
	List<ProductDetail> getProductDetailsByProduct(Product product);
	List<ProductDetail> getProductDetailsByOrder(Order order);
	List<ProductDetail> getProductDetailsByCustomer(Customer customer);
	ProductDetail getProductDetail(int id);
}
