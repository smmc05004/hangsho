package kr.co.hangsho.company.vo;

public class CompanyForm {

	private String username;
	private String password;
	private String name;
	private String postalcode;
	private String mainaddress;
	private String detailaddress;
	private String phonenumber; 
	private String ceonumber;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getCeonumber() {
		return ceonumber;
	}
	public void setCeonumber(String ceonumber) {
		this.ceonumber = ceonumber;
	}
	@Override
	public String toString() {
		return "CompanyForm [username=" + username + ", password=" + password + ", name=" + name + ", postalcode="
				+ postalcode + ", mainaddress=" + mainaddress + ", detailaddress=" + detailaddress + ", phonenumber="
				+ phonenumber + ", ceonumber=" + ceonumber + "]";
	}
}
