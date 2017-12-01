package kr.co.hangsho.orders.vo;

import kr.co.hangsho.item.vo.Item;

public class OrderDetail {

	private Order order;
	private int orderId;
	private Item item;
	private int orderQuantity;
	private int realPrice;
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	public int getRealPrice() {
		return realPrice;
	}
	public void setRealPrice(int realPrice) {
		this.realPrice = realPrice;
	}
	public int getOrderQuantity() {
		return orderQuantity;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	@Override
	public String toString() {
		return "OrderDetail [orderId=" + orderId + ", item=" + item + ", orderQuantity=" + orderQuantity
				+ ", realPrice=" + realPrice + "]";
	}

}
