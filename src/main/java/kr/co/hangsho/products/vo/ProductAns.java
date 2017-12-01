package kr.co.hangsho.products.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import kr.co.hangsho.company.vo.Company;

public class ProductAns {

	private int id;
	private ProductQue qna;
	private String answer;
	private Date createDate;
	private Company company;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public ProductQue getQna() {
		return qna;
	}
	public void setQna(ProductQue qna) {
		this.qna = qna;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	
	public String getStrCreateDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (createDate != null) {
			return sdf.format(createDate);
		} else {
			return "";
		}
	}
	@Override
	public String toString() {
		return "productAns [id=" + id + ", qna=" + qna + ", answer=" + answer + ", createDate=" + createDate
				+ ", company=" + company + "]";
	}
}
