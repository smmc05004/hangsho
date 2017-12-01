package kr.co.hangsho.carts.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.carts.mappers.CartMapper;
import kr.co.hangsho.carts.vo.Cart;
import kr.co.hangsho.carts.vo.CartDetail;
import kr.co.hangsho.customers.vo.Customer;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartMapper cartMapper;

	@Override
	public List<CartDetail> getItemLists(Customer customer) {
		return cartMapper.getItemLists(customer);
	}

	@Override
	public void addItemToCart(List<CartDetail> cartDetails, Customer customer) {
		Integer cartId = getCartId(customer);
		for(CartDetail cartDetail : cartDetails) {
			if(cartDetail.getProductQuantity() != 0) {
				
			if(cartId == null ) {
				addNewCart(customer);
				cartId = getCartId(customer);
			}
			Cart cart = new Cart();
			cart.setId(getCartId(customer));
			cartDetail.setCart(cart);
			cartMapper.addItemToCart(cartDetail);
			}
		}
	}

	@Override
	public void addNewCart(Customer customer) {
		cartMapper.addNewCart(customer);
	}

	@Override
	public Integer getCartId(Customer customer) {
		return cartMapper.getCartId(customer);
	}
@Override
public void deleteCart(Customer customer) {
	int cartId = getCartId(customer);
	cartMapper.deleteCart(cartId);
}

	


	

}
