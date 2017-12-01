package kr.co.hangsho.privatedeal.vo;

import java.util.Date;

import kr.co.hangsho.categories.vo.SmallCategory;
import kr.co.hangsho.codes.vo.Code;
import kr.co.hangsho.customers.vo.Customer;

public class Privatedeal {
	
	private Integer id;
	private Date createdate;
	private Code status;
	private String deleted;
	private int clicked;
	private Code type;
	private Customer customer;	
	private Code division;	
	private SmallCategory smallcategory;
	private Integer desiredprice;
	private String title;
	private String contents;
	private int requestCnt;
	private int commentCnt;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public Code getStatus() {
		return status;
	}
	public void setStatus(Code status) {
		this.status = status;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public int getClicked() {
		return clicked;
	}
	public void setClicked(int clicked) {
		this.clicked = clicked;
	}
	public Code getType() {
		return type;
	}
	public void setType(Code type) {
		this.type = type;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Code getDivision() {
		return division;
	}
	public void setDivision(Code division) {
		this.division = division;
	}
	public SmallCategory getSmallcategory() {
		return smallcategory;
	}
	public void setSmallcategory(SmallCategory smallcategory) {
		this.smallcategory = smallcategory;
	}
	public Integer getDesiredprice() {
		return desiredprice;
	}
	public void setDesiredprice(Integer desiredprice) {
		this.desiredprice = desiredprice;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}	
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}	
	public int getRequestCnt() {
		return requestCnt;
	}
	public void setRequestCnt(int requestCnt) {
		this.requestCnt = requestCnt;
	}	
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	
	@Override
	public String toString() {
		return "Privatedeal [id=" + id + ", createdate=" + createdate + ", status=" + status + ", deleted=" + deleted
				+ ", clicked=" + clicked + ", type=" + type + ", customer=" + customer + ", division=" + division
				+ ", smallcategory=" + smallcategory + ", desiredprice=" + desiredprice + ", title=" + title
				+ ", editor=" + contents + "]";
	}	
}
