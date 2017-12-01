package kr.co.hangsho.codes.vo;

public class Code {
	
	private String id;
	private String name;
	private String div;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	
	@Override
	public String toString() {
		return "Code [id=" + id + ", name=" + name + ", div=" + div + "]";
	}	
}
