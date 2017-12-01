package kr.co.hangsho.privatedeal.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.web.serializer.DateSerializer;

public class Comment {
	
	private int id;
	private Customer customer;
	@JsonSerialize(using=DateSerializer.class)
	private Date createdate;
	private String comment;
	private Privatedeal boardId;
	private Comment repliedId;
	private Comment groupId;
	private String deleted;
	private boolean isModified;
	private int groupIdCount;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Privatedeal getBoardId() {
		return boardId;
	}
	public void setBoardId(Privatedeal boardId) {
		this.boardId = boardId;
	}
	public Comment getRepliedId() {
		return repliedId;
	}
	public void setRepliedId(Comment repliedId) {
		this.repliedId = repliedId;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}		
	public Comment getGroupId() {
		return groupId;
	}
	public void setGroupId(Comment groupId) {
		this.groupId = groupId;
	}	
	public boolean isModified() {
		return isModified;
	}
	public void setModified(boolean isModified) {
		this.isModified = isModified;
	}	
	public int getGroupIdCount() {
		return groupIdCount;
	}
	public void setGroupIdCount(int groupIdCount) {
		this.groupIdCount = groupIdCount;
	}
	
	@Override
	public String toString() {
		return "Comment [id=" + id + ", customer=" + customer + ", createdate=" + createdate + ", contents=" + comment
				+ ", boardId=" + boardId + ", repliedId=" + repliedId + ", deleted=" + deleted + "]";
	}	
}
