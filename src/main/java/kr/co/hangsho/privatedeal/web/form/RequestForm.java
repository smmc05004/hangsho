package kr.co.hangsho.privatedeal.web.form;

public class RequestForm {
	
	private String contents;
	private Integer desiredPrice;
	private int boardNo;
	
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getDesiredPrice() {
		return desiredPrice;
	}
	public void setDesiredPrice(Integer desiredPrice) {
		this.desiredPrice = desiredPrice;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	@Override
	public String toString() {
		return "RequestForm [contents=" + contents + ", desiredPrice=" + desiredPrice + ", boardNo=" + boardNo + "]";
	}	
}
