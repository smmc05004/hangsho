package kr.co.hangsho.sliders.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Slider {
	
	private int id;
	private Date startDate;
	private Date endDate;
	private String deleted;
	private String type;
	
	public String getStartDateFormat() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startDateFormat = sdf.format(startDate);
		return startDateFormat;
	}
	
	public String getEndDateFormat() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String endDateFormat = sdf.format(endDate);
		return endDateFormat;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Slider [id=" + id + ", startDate=" + startDate + ", endDate=" + endDate + ", deleted=" + deleted
				+ ", type=" + type + "]";
	}
		
	
}
