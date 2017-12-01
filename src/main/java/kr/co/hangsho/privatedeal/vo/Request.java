package kr.co.hangsho.privatedeal.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import kr.co.hangsho.codes.vo.Code;
import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.web.serializer.DateSerializer;

public class Request {
	
	private int id;
	private String contents;
	@JsonSerialize(using=DateSerializer.class)
	private Date createdate;
	private Code status;
	private Integer desiredPrice;
	private String cancel;
	private Privatedeal board;
	private Customer requestor;
	private Code division;
	private Code type;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public Code getStatus() {
		return status;
	}
	public void setStatus(Code status) {
		this.status = status;
	}
	public Integer getDesiredPrice() {
		return desiredPrice;
	}
	public void setDesiredPrice(Integer desiredPrice) {
		this.desiredPrice = desiredPrice;
	}
	public String getCancel() {
		return cancel;
	}
	public void setCancel(String cancel) {
		this.cancel = cancel;
	}
	public Privatedeal getBoard() {
		return board;
	}
	public void setBoard(Privatedeal board) {
		this.board = board;
	}
	public Customer getRequestor() {
		return requestor;
	}
	public void setRequestor(Customer requestor) {
		this.requestor = requestor;
	}	
	public Code getDivision() {
		return division;
	}
	public void setDivision(Code division) {
		this.division = division;
	}	
	public Code getType() {
		return type;
	}
	public void setType(Code type) {
		this.type = type;
	}	
	
	@Override
	public String toString() {
		return "Request [id=" + id + ", contents=" + contents + ", createdate=" + createdate + ", status=" + status
				+ ", desiredPrice=" + desiredPrice + ", cancel=" + cancel + ", board=" + board + ", requestor="
				+ requestor + "]";
	}	
}
