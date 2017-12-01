package kr.co.hangsho.customers.vo;

public class RegisterForm {

	private String customername;
	private String password;
	private String name;
	private String phonenumber;
	private String postalcode;
	private String mainaddress;
	private String detailaddress;
	private String nickname;
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUsername() {
		return customername;
	}
	public void setUsername(String customername) {
		this.customername = customername;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getPostalcode() {
		return postalcode;
	}
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	public String getMainaddress() {
		return mainaddress;
	}
	public void setMainaddress(String mainaddress) {
		this.mainaddress = mainaddress;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	@Override
	public String toString() {
		return "RegisterForm [customername=" + customername + ", password=" + password + ", name=" + name + ", phonenumber="
				+ phonenumber + ", postalcode=" + postalcode + ", mainaddress=" + mainaddress + ", detailaddress="
				+ detailaddress + "]";
	}
	
	
}
