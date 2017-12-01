package kr.co.hangsho.qnas.vo;

import java.util.Date;

import kr.co.hangsho.customers.vo.Customer;

public class Qna {

	private int id;
	private Date createDate;
	private Date replyDate;
	private String title;
	private String contents;
	private String attachedFile;
	private String type;
	private Customer customer;
	private int replyId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
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
	public String getAttachedFile() {
		return attachedFile;
	}
	public void setAttachedFile(String attachedFile) {
		this.attachedFile = attachedFile;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	@Override
	public String toString() {
		return "Qna [id=" + id + ", createDate=" + createDate + ", replyDate=" + replyDate + ", title=" + title
				+ ", contents=" + contents + ", attachedFile=" + attachedFile + ", type=" + type + ", customer="
				+ customer + ", replyId=" + replyId + "]";
	}
	
	
	
	
	
}
