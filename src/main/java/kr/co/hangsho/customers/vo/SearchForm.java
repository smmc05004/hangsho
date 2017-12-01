package kr.co.hangsho.customers.vo;

import java.util.Date;

public class SearchForm {

	private int search;
	private Date beginday;
	private Date endday;
	public int getSearch() {
		return search;
	}
	public void setSearch(int search) {
		this.search = search;
	}
	public Date getBeginday() {
		return beginday;
	}
	public void setBeginday(Date beginday) {
		this.beginday = beginday;
	}
	public Date getEndday() {
		return endday;
	}
	public void setEndday(Date endday) {
		this.endday = endday;
	}
	@Override
	public String toString() {
		return "SearchForm [search=" + search + ", beginday=" + beginday + ", endday=" + endday + "]";
	}
	
	
}
