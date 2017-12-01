package kr.co.hangsho.products.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import kr.co.hangsho.customers.vo.Customer;

public class ProductQue {

	private int id;
	private String question;
	private Product product;
	private Customer customer;
	private Date createDate;
	private String deleted;
	private String title;
	private String status;
	
	@Override
	public String toString() {
		return "ProductQue [id=" + id + ", question=" + question + ", product=" + product + ", customer=" + customer
				+ ", createDate=" + createDate + ", deleted=" + deleted + ", title=" + title + ", status=" + status
				+ "]";
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
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
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStrCreateDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (createDate != null) {
			return sdf.format(createDate);
		} else {
			return "";
		}
	}
	
	
}
