package kr.co.hangsho.privatedeal.web.form;

public class PrivatedealForm {
	
	private String division;
	private int bigcategory;
	private int middlecategory;
	private int smallcategory;
	private Integer desiredprice;
	private String title;
	private String contents;
	private Integer id;
	
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public int getBigcategory() {
		return bigcategory;
	}
	public void setBigcategory(int bigcategory) {
		this.bigcategory = bigcategory;
	}
	public int getMiddlecategory() {
		return middlecategory;
	}
	public void setMiddlecategory(int middlecategory) {
		this.middlecategory = middlecategory;
	}
	public int getSmallcategory() {
		return smallcategory;
	}
	public void setSmallcategory(int smallcategory) {
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "PrivatedealForm [division=" + division + ", bigcategory=" + bigcategory + ", middlecategory="
				+ middlecategory + ", smallcategory=" + smallcategory + ", desiredprice=" + desiredprice + ", title="
				+ title + ", contents=" + contents + ", id=" + id + "]";
	}	
}
