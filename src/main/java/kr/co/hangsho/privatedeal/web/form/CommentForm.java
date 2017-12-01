package kr.co.hangsho.privatedeal.web.form;

public class CommentForm {
	
	private int boardNo;
	private String comment;
	private int rno;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	@Override
	public String toString() {
		return "CommentForm [boardNo=" + boardNo + ", comment=" + comment + ", rno=" + rno + "]";
	}	
}
