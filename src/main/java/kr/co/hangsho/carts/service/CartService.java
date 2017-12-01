package kr.co.hangsho.carts.service;

import java.util.List;

import kr.co.hangsho.carts.vo.CartDetail;
import kr.co.hangsho.customers.vo.Customer;

public interface CartService {
	List<CartDetail>getItemLists(Customer customer);
	void addItemToCart(List<CartDetail> cartDetails, Customer customer);
	void addNewCart(Customer customer);
	Integer getCartId(Customer customer);
	void deleteCart(Customer customer);
}

