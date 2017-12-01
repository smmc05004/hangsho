package kr.co.hangsho.customers.vo;

import org.apache.commons.codec.digest.DigestUtils;

public class InfoForm {

	private String password;
	private String passwordCheck;
	private String phonenumber;
	private String postalcode;
	private String mainaddress;
	private String detailaddress;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		if(password.equals(""))
			this.password = null;
		else
			this.password = DigestUtils.sha256Hex(password);
	}
	public String getPasswordCheck() {
		return passwordCheck;
	}
	public void setPasswordCheck(String passwordCheck) {
		if(passwordCheck.equals(""))
			this.passwordCheck = null;
		else
			this.passwordCheck = DigestUtils.sha256Hex(passwordCheck);
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
		return "InfoForm [password=" + password + ", passwordCheck=" + passwordCheck
				+ ", phonenumber=" + phonenumber + ", postalcode=" + postalcode + ", mainaddress=" + mainaddress
				+ ", detailaddress=" + detailaddress + "]";
	}
	
	
}
