package kr.co.hangsho.products.vo;

import java.util.Date;

import kr.co.hangsho.customers.vo.Customer;

public class ProductReview {

	private int id;
	private String comment;
	private Date createDate;
	private Integer rates;
	private Product product;
	private Customer customer;
	private String deleted;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getRates() {
		return rates;
	}
	public void setRates(Integer rates) {
		this.rates = rates;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	@Override
	public String toString() {
		return "ProductReview [id=" + id + ", comment=" + comment + ", createDate=" + createDate + ", rates=" + rates
				+ ", product=" + product + ", customer=" + customer + ", deleted=" + deleted + "]";
	}

	
	
}
