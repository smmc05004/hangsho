package kr.co.hangsho.products.vo;

import kr.co.hangsho.images.vo.Image;

public class ProductDetail {

	private int id;
	private String option;
	private int initialQuantity;
	private int saledQuantity;
	private Product product;
	private int price;
	private Image image;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public int getInitialQuantity() {
		return initialQuantity;
	}
	public void setInitialQuantity(int initialQuantity) {
		this.initialQuantity = initialQuantity;
	}
	public int getSaledQuantity() {
		return saledQuantity;
	}
	public void setSaledQuantity(int saledQuantity) {
		this.saledQuantity = saledQuantity;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Image getImage() {
		return image;
	}
	public void setImage(Image image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "ProductDetail [id=" + id + ", option=" + option + ", initialQuantity=" + initialQuantity
				+ ", saledQuantity=" + saledQuantity + ", product=" + product + ", price=" + price + ", image=" + image
				+ "]";
	}
	
}
