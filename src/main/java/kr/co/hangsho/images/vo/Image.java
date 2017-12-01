package kr.co.hangsho.images.vo;

public class Image {

	private int id;
	private String path;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@Override
	public String toString() {
		return "Image [id=" + id + ", path=" + path + "]";
	}
}
