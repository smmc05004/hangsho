package kr.co.hangsho.privatedeal.vo;

import java.util.Date;

import kr.co.hangsho.codes.vo.Code;
import kr.co.hangsho.customers.vo.Customer;

public class Deal {
	
	private int id;
	private Privatedeal board;
	private Date createdate;
	private Code status;
	private int payment;
	private Customer seller;
	private Customer buyer;
	private String cancel;
	private Code type;
	private String dscCode;
	private String transportNumber;
	private String apiKey;
	
	public String getApiKey() {
		return apiKey;
	}
	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Privatedeal getBoard() {
		return board;
	}
	public void setBoard(Privatedeal board) {
		this.board = board;
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
	public String getTransportNumber() {
		return transportNumber;
	}
	public void setTransportNumber(String transportNumber) {
		this.transportNumber = transportNumber;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public Customer getSeller() {
		return seller;
	}
	public void setSeller(Customer seller) {
		this.seller = seller;
	}
	public Customer getBuyer() {
		return buyer;
	}
	public void setBuyer(Customer buyer) {
		this.buyer = buyer;
	}
	public String getCancel() {
		return cancel;
	}
	public void setCancel(String cancel) {
		this.cancel = cancel;
	}	
	public Code getType() {
		return type;
	}
	public void setType(Code type) {
		this.type = type;
	}	
	public String getDscCode() {
		return dscCode;
	}
	public void setDscCode(String dscCode) {
		this.dscCode = dscCode;
	}
	
	@Override
	public String toString() {
		return "Deal [id=" + id + ", board=" + board + ", createdate=" + createdate + ", status=" + status
				+ ", transportNumber=" + transportNumber + ", payment=" + payment + ", seller=" + seller + ", buyer="
				+ buyer + ", cancel=" + cancel + "]";
	}		
}
