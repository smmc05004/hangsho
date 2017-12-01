package kr.co.hangsho.privatedeal.vo;

public class Pagination {
	
	private Integer rows = 4;				// 리스트 행 개수
	private Integer pages = 5;				// 페이지네이션 개수
	private Integer pageNo = 1;
	private Integer boardNo;
	private int totalRows;
	
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
	public Integer getPages() {
		return pages;
	}
	public void setPages(Integer pages) {
		this.pages = pages;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}	
}
