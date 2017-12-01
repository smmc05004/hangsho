package kr.co.hangsho.products.web.form;


public class ProductQueForm {

	// 상품문의 Modal창 폼 입력
	private int productId;
	private String title;
	private String question;
	
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}	
}
