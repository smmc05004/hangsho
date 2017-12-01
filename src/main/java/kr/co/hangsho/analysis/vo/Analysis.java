package kr.co.hangsho.analysis.vo;

public class Analysis {

	private long profit;
	private String day;
	private String category;
	private int quantity;
	
	public long getProfit() {
		return profit;
	}
	public void setProfit(long profit) {
		this.profit = profit;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "Analysis [profit=" + profit + ", day=" + day + ", category=" + category + ", quantity=" + quantity
				+ "]";
	}
}
