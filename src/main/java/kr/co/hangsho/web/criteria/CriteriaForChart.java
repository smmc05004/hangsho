package kr.co.hangsho.web.criteria;


public class CriteriaForChart {
	
	private int itemId;
	private String selectDate;
	private int companyId;
	
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	
	public String getSelectDate() {
		return selectDate;
	}
	public void setSelectDate(String selectDate) {
		this.selectDate = selectDate;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	@Override
	public String toString() {
		return "CriteriaForChart [itemId=" + itemId + ", selectDate=" + selectDate + ", companyId=" + companyId + "]";
	}

	
	
}
