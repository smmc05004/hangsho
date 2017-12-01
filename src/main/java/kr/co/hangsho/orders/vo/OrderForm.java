package kr.co.hangsho.orders.vo;

import java.util.Arrays;

public class OrderForm {

	private String orderMessage;
	private String orderReceiver;
	private int orderPrice;
	
	private int[] itemId;
	private int orderRealPrice;
	private int[] orderQuantity;
	
	private String deliveryTitle;
	private String main;
	private String detail;
	private String postalCode;
	private Integer deliveryId;

	private int couponId;

	private int customerPoint;

	public String getOrderMessage() {
		return orderMessage;
	}

	public void setOrderMessage(String orderMessage) {
		this.orderMessage = orderMessage;
	}

	public String getOrderReceiver() {
		return orderReceiver;
	}

	public void setOrderReceiver(String orderReceiver) {
		this.orderReceiver = orderReceiver;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int[] getItemId() {
		return itemId;
	}

	public void setItemId(int[] itemId) {
		this.itemId = itemId;
	}

	public int getOrderRealPrice() {
		return orderRealPrice;
	}

	public void setOrderRealPrice(int orderRealPrice) {
		this.orderRealPrice = orderRealPrice;
	}

	public int[] getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(int[] orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public String getDeliveryTitle() {
		return deliveryTitle;
	}

	public void setDeliveryTitle(String deliveryTitle) {
		this.deliveryTitle = deliveryTitle;
	}

	public String getMain() {
		return main;
	}

	public void setMain(String main) {
		this.main = main;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public Integer getDeliveryId() {
		return deliveryId;
	}

	public void setDeliveryId(Integer deliveryId) {
		this.deliveryId = deliveryId;
	}

	public int getCouponId() {
		return couponId;
	}

	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}

	public int getCustomerPoint() {
		return customerPoint;
	}

	public void setCustomerPoint(int customerPoint) {
		this.customerPoint = customerPoint;
	}

	@Override
	public String toString() {
		return "OrderForm [orderMessage=" + orderMessage + ", orderReceiver=" + orderReceiver + ", orderPrice="
				+ orderPrice + ", itemId=" + Arrays.toString(itemId) + ", orderRealPrice=" + orderRealPrice
				+ ", orderQuantity=" + Arrays.toString(orderQuantity) + ", deliveryTitle=" + deliveryTitle + ", main="
				+ main + ", detail=" + detail + ", postalCode=" + postalCode + ", deliveryId=" + deliveryId
				+ ", couponId=" + couponId + ", customerPoint=" + customerPoint + "]";
	}
	
	
}
