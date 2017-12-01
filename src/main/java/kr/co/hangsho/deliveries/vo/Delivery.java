package kr.co.hangsho.deliveries.vo;

import kr.co.hangsho.customers.vo.Customer;

public class Delivery {

	private int id;
	private String mainAddress;
	private String title;
	private Customer customer;
	private String postalCode;
	private String detailAddress;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMainAddress() {
		return mainAddress;
	}
	public void setMainAddress(String mainAddress) {
		this.mainAddress = mainAddress;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	@Override
	public String toString() {
		return "Delivery [id=" + id + ", mainAddress=" + mainAddress + ", title=" + title + ", customer=" + customer
				+ ", postalCode=" + postalCode + ", detailAddress=" + detailAddress + "]";
	}

	
}
