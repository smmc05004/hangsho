package kr.co.hangsho.review.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.products.vo.Product;

public class Review {

	private int id;
	private String comment;
	private Date createDate;
	private int rates;
	private Product product;
	private Customer customer;
	private char deleted;
	
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
	public int getRates() {
		return rates;
	}
	public void setRates(int rates) {
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
	public char getDeleted() {
		return deleted;
	}
	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}
	
	public String getStrCreateDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (createDate != null) {
			return sdf.format(createDate);
		} else {
			return "";
		}
	}
	
	@Override
	public String toString() {
		return "Review [id=" + id + ", comment=" + comment + ", createDate=" + createDate + ", rates=" + rates
				+ ", product=" + product + ", customer=" + customer + ", deleted=" + deleted + "]";
	}
}
