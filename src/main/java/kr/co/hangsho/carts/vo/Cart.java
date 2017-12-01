package kr.co.hangsho.carts.vo;

import kr.co.hangsho.customers.vo.Customer;

public class Cart {

	private int id;
	private Customer customer;
	
	public int getId() {
		return id;
	}
	public Cart setId(int id) {
		this.id = id;
		return this;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", customer=" + customer + "]";
	}

}
