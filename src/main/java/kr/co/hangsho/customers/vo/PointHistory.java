package kr.co.hangsho.customers.vo;

import java.util.Date;

public class PointHistory {

	private Date pointHistoryDate;
	private String pointHistoryDescription;
	private int pointHistoryValue;
	private Customer customerId;
	
	public Date getPointHistoryDate() {
		return pointHistoryDate;
	}
	public void setPointHistoryDate(Date pointHistoryDate) {
		this.pointHistoryDate = pointHistoryDate;
	}
	public String getPointHistoryDescription() {
		return pointHistoryDescription;
	}
	public void setPointHistoryDescription(String pointHistoryDescription) {
		this.pointHistoryDescription = pointHistoryDescription;
	}
	public int getPointHistoryValue() {
		return pointHistoryValue;
	}
	public void setPointHistoryValue(int pointHistoryValue) {
		this.pointHistoryValue = pointHistoryValue;
	}
	public Customer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Customer customerId) {
		this.customerId = customerId;
	}
	@Override
	public String toString() {
		return "PointHistory [pointHistoryDate=" + pointHistoryDate + ", pointHistoryDescription="
				+ pointHistoryDescription + ", pointHistoryValue=" + pointHistoryValue + ", customerId=" + customerId
				+ "]";
	}
	
	
}
