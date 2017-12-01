package kr.co.hangsho.carts.vo;

import kr.co.hangsho.item.vo.Item;

public class CartDetail {

	private int productQuantity;
	private Cart cart;
	private Item item;
	
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	@Override
	public String toString() {
		return "CartDetail [productQuantity=" + productQuantity + ", cart=" + cart + ", item=" + item + "]";
	}

	
	
}
