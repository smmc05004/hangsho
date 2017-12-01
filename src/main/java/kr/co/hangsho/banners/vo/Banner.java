package kr.co.hangsho.banners.vo;

import java.util.Date;

import kr.co.hangsho.images.vo.Image;

public class Banner {

	private int id;
	private Date endDate;
	private Date startDate;
	private String deleted;
	private Image image;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public Image getImage() {
		return image;
	}
	public void setImage(Image image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "Banner [id=" + id + ", endDate=" + endDate + ", startDate=" + startDate + ", deleted=" + deleted
				+ ", image=" + image + "]";
	}
	
	
	
	
	
}
