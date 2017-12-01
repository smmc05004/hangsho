package kr.co.hangsho.item.vo;

import java.util.Date;

import kr.co.hangsho.images.vo.Image;
import kr.co.hangsho.products.vo.Product;

public class Item {

	private int id;
	private String options;
	private int initialQuantity;
	private int saledQuantity;
	private Product product;
	private int salePrice;
	private int originalPrice;
	private Image image;
	private Date createdate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
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
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public Integer getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(Integer originalPrice) {
		this.originalPrice = originalPrice;
	}
	public Image getImage() {
		return image;
	}
	public void setImage(Image image) {
		this.image = image;
	}
	
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	
	@Override
	public String toString() {
		return "Item [id=" + id + ", options=" + options + ", initialQuantity=" + initialQuantity + ", saledQuantity="
				+ saledQuantity + ", product=" + product + ", salePrice=" + salePrice + ", originalPrice=" + originalPrice
				+ ", image=" + image + ", createdate=" + createdate + "]";
	}
	
	
}
