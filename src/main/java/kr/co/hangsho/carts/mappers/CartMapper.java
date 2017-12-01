package kr.co.hangsho.carts.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.carts.vo.CartDetail;
import kr.co.hangsho.customers.vo.Customer;

@Mapper
public interface CartMapper {

	List<CartDetail>getItemLists(Customer customer);
	void addItemToCart(CartDetail cartDetail);
	void addNewCart(Customer customer);
	Integer getCartId(Customer customer);
	void deleteCart(int cartId);
	
}
