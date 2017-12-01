package kr.co.hangsho.notices.vo;

import java.util.Date;

public class Notice {
	
	private int id;
	private String title;
	private String contents;
	private String type;
	private Date createDate;
	private String deleted;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	@Override
	public String toString() {
		return "Notice [id=" + id + ", title=" + title + ", contents=" + contents + ", type=" + type + ", createDate="
				+ createDate + ", deleted=" + deleted + "]";
	}
	

}
