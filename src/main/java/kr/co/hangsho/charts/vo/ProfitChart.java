package kr.co.hangsho.charts.vo;

public class ProfitChart {
	
	private String name;
	private String dates;
	private int tm;
	private int profit;
	private int qty;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public int getTm() {
		return tm;
	}
	public void setTm(int tm) {
		this.tm = tm;
	}
	public int getProfit() {
		return profit;
	}
	public void setProfit(int profit) {
		this.profit = profit;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	@Override
	public String toString() {
		return "ProfitChart [name=" + name + ", dates=" + dates + ", tm=" + tm + ", profit=" + profit + ", qty=" + qty
				+ "]";
	}

	
}
