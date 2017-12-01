package kr.co.hangsho.web.criteria;

import java.util.Date;

public class Criteria {
	
	private Integer rows = 10;				// 리스트 행 개수
	private Integer pages = 5;				// 페이지네이션 개수
	private Integer pageNo = 1;			
	private String opt;
	private String keyword;
	private Date beginday;
	private Date endday;
	private Integer sc;
	private Integer mc;
	private Integer bc;
	private String division;
	private String type;
	private int totalRows;
	private int customerNo;
	
	public int getBeginIndex() {				// 리스트 행 시작 숫자
		return (pageNo -1) * rows + 1;
	}
	
	public int getEndIndex() {					// 리스트 행 마지막 숫자
		return pageNo * rows;	
	}
	
	public int getTotalPages() {				// 총 페이지 개수
		return (int) Math.ceil((double) totalRows/rows);
	}
	
	public int getTotalBlock() {					// 총 블럭 개수
		return (int) Math.ceil((double) getTotalPages()/pages);
	}
	
	public int getCurrentBlock() {			// 현재 블럭 숫자
		return (int) Math.ceil((double) pageNo/pages);
	}
	
	public int getBeginPage( ) {				// (한 블럭의) 페이지네이션 처음 숫자
		return (getCurrentBlock() - 1) * pages + 1;
	}
	
	public int getEndPage() {					// (한 블럭의) 페이지네이션 마지막 숫자
		if (getCurrentBlock() == getTotalBlock()) {
			return getTotalPages();
		}
		return getCurrentBlock() * pages;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = (pageNo == null) ? 1 : pageNo;
	}

	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public Integer getPages() {
		return pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
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
	
	public Integer getSc() {
		return sc;
	}

	public void setSc(Integer sc) {
		this.sc = sc;
	}

	public Integer getMc() {
		return mc;
	}

	public void setMc(Integer mc) {
		this.mc = mc;
	}

	public Integer getBc() {
		return bc;
	}

	public void setBc(Integer bc) {
		this.bc = bc;
	}
	
	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}	

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	@Override
	public String toString() {
		return "Criteria [rows=" + rows + ", pages=" + pages + ", pageNo=" + pageNo + ", opt=" + opt + ", keyword="
				+ keyword + ", beginday=" + beginday + ", endday=" + endday + ", sc=" + sc + ", mc=" + mc + ", bc=" + bc
				+ ", division=" + division + ", totalRows=" + totalRows + "]";
	}	
}
