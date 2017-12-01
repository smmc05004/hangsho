package kr.co.hangsho.sliders.vo;

import kr.co.hangsho.products.vo.Product;

public class SliderInformation {
	
	private Slider slider;
	private Product product;
	private int showingPrice;
	private int initialQty;
	private int saledQty;
	
	
	public int getInitialQty() {
		return initialQty;
	}
	public void setInitialQty(int initialQty) {
		this.initialQty = initialQty;
	}
	public int getSaledQty() {
		return saledQty;
	}
	public void setSaledQty(int saledQty) {
		this.saledQty = saledQty;
	}
	public int getShowingPrice() {
		return showingPrice;
	}
	public void setShowingPrice(int showingPrice) {
		this.showingPrice = showingPrice;
	}
	public Slider getSlider() {
		return slider;
	}
	public void setSlider(Slider slider) {
		this.slider = slider;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "SliderInformation [slider=" + slider + ", product=" + product + ", showingPrice=" + showingPrice
				+ ", initialQty=" + initialQty + ", saledQty=" + saledQty + "]";
	}

}
