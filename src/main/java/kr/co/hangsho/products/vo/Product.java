package kr.co.hangsho.products.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.co.hangsho.categories.vo.SmallCategory;
import kr.co.hangsho.company.vo.Company;
import kr.co.hangsho.images.vo.Image;
import kr.co.hangsho.orders.vo.OrderDetail;

public class Product {
	
	private int id;
	private SmallCategory smallCategory;	
	private int deliveryFee;
	private String description;
	private int clicked;
	private Company company;
	private Image image;
	private int discountRatio;
	private String name;
	private String show;
	private Date createDate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public SmallCategory getSmallCategory() {
		return smallCategory;
	}
	public void setSmallCategory(SmallCategory smallCategory) {
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
	public int getClicked() {
		return clicked;
	}
	public void setClicked(int clicked) {
		this.clicked = clicked;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public Image getImage() {
		return image;
	}
	public void setImage(Image image) {
		this.image = image;
	}
	public int getDiscountRatio() {
		return discountRatio;
	}
	public void setDiscountRatio(int discountRatio) {
		this.discountRatio = discountRatio;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", smallCategory=" + smallCategory + ", deliveryFee=" + deliveryFee
				+ ", description=" + description + ", clicked=" + clicked + ", company=" + company + ", image=" + image
				+ ", discountRatio=" + discountRatio + ", name=" + name + ", show=" + show + ", createDate="
				+ createDate + "]";
	}
}
