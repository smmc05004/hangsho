package kr.co.hangsho.categories.vo;

public class MiddleCategory {

	private int id;
	private String name;
	private BigCategory bigCategory;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigCategory getBigCategory() {
		return bigCategory;
	}
	public void setBigCategory(BigCategory bigCategory) {
		this.bigCategory = bigCategory;
	}
	@Override
	public String toString() {
		return "MiddleCategory [id=" + id + ", name=" + name + ", bigCategory=" + bigCategory + "]";
	}
	
	
	
	
}
