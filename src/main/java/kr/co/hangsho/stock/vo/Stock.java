package kr.co.hangsho.stock.vo;

import java.util.Date;

import kr.co.hangsho.item.vo.Item;

public class Stock {

	private Item item;
	private int quantity;
	private Date historyDate;
	private String reasons;
	
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getHistoryDate() {
		return historyDate;
	}
	public void setHistoryDate(Date historyDate) {
		this.historyDate = historyDate;
	}
	public String getReasons() {
		return reasons;
	}
	public void setReasons(String reasons) {
		this.reasons = reasons;
	}
	@Override
	public String toString() {
		return "Stock [item=" + item + ", quantity=" + quantity + ", historyDate=" + historyDate + ", reasons="
				+ reasons + "]";
	}
}
