package kr.co.hangsho.categories.vo;

public class BigCategory {

	private int id;
	private String name;
	
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
	@Override
	public String toString() {
		return "BigCategory [id=" + id + ", name=" + name + "]";
	}
	

	
}
