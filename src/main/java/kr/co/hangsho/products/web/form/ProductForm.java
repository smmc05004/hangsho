package kr.co.hangsho.products.web.form;

import org.springframework.web.multipart.MultipartFile;

public class ProductForm {

	private String name;
	private int bigCategory;
	private int middleCategory;
	private int smallCategory;
	private int deliveryFee;
	private String description;
	private int discountRatio;
	private MultipartFile imagefile;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBigCategory() {
		return bigCategory;
	}
	public void setBigCategory(int bigCategory) {
		this.bigCategory = bigCategory;
	}
	public int getMiddleCategory() {
		return middleCategory;
	}
	public void setMiddleCategory(int middleCategory) {
		this.middleCategory = middleCategory;
	}
	public int getSmallCategory() {
		return smallCategory;
	}
	public void setSmallCategory(int smallCategory) {
		this.smallCategory = smallCategory;
	}
	public int getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getDiscountRatio() {
		return discountRatio;
	}
	public void setDiscountRatio(int discountRatio) {
		this.discountRatio = discountRatio;
	}
	public MultipartFile getImagefile() {
		return imagefile;
	}
	public void setImagefile(MultipartFile imagefile) {
		this.imagefile = imagefile;
	}
	@Override
	public String toString() {
		return "ProductForm [name=" + name + ", bigCategory=" + bigCategory + ", middleCategory=" + middleCategory
				+ ", smallCategory=" + smallCategory + ", deliveryFee=" + deliveryFee + ", description=" + description
				+ ", discountRatio=" + discountRatio + ", imagefile=" + imagefile + "]";
	}
	
}
