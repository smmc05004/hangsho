package kr.co.hangsho.products.vo;

import java.util.Date;

import kr.co.hangsho.item.vo.Item;

public class ProductStockHistory {

	private Date dates;
	private int quantity;
	private Item item;
	
	public Date getDates() {
		return dates;
	}
	public void setDates(Date dates) {
		this.dates = dates;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	@Override
	public String toString() {
		return "ProductStockHistory [dates=" + dates + ", quantity=" + quantity + ", item=" + item + "]";
	}
	
	
}
