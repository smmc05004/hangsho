package kr.co.hangsho.categories.vo;

public class SmallCategory {

	private int id;
	private String name;
	private MiddleCategory midCategory;
	
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
	public MiddleCategory getMidCategory() {
		return midCategory;
	}
	public void setMidCategory(MiddleCategory midCategory) {
		this.midCategory = midCategory;
	}
	@Override
	public String toString() {
		return "SmallCategory [id=" + id + ", name=" + name + ", midCategory=" + midCategory + "]";
	}
	

}
