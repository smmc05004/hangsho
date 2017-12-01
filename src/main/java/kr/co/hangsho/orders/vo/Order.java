package kr.co.hangsho.orders.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.deliveries.vo.Delivery;

public class Order {

	private List<OrderDetail> orderDetails = new ArrayList();
	private int id;
	private String condition;
	private String message;
	private Customer customer;
	private Delivery delivery;
	private Date orderDate;
	private int price;
	private String receiver;
	
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public void addOrderDetail(OrderDetail orderDetail) {
		orderDetails.add(orderDetail);
	}
	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Delivery getDelivery() {
		return delivery;
	}
	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Order [orderDetails=" + orderDetails + ", id=" + id + ", condition=" + condition + ", message="
				+ message + ", customer=" + customer + ", delivery=" + delivery + ", orderDate=" + orderDate
				+ ", price=" + price + ", receiver=" + receiver + "]";
	}
	
	
}
