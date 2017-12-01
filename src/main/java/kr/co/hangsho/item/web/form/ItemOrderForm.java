package kr.co.hangsho.item.web.form;

import java.util.Arrays;

public class ItemOrderForm {

	private int productId;
	private int [] itemId;
	private int[] proqty;
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int[] getItemId() {
		return itemId;
	}
	public void setItemId(int[] itemId) {
		this.itemId = itemId;
	}
	public int[] getProqty() {
		return proqty;
	}
	public void setProqty(int[] proqty) {
		this.proqty = proqty;
	}
	@Override
	public String toString() {
		return "ItemOrderForm [productId=" + productId + ", itemId=" + Arrays.toString(itemId) + ", proqty="
				+ Arrays.toString(proqty) + "]";
	}

}
