package kr.co.hangsho.admin.vo;

import java.util.Date;

public class LoginHistory {

	private String ip;
	private Date time;
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "LoginHistory [ip=" + ip + ", time=" + time + "]";
	}
	
	
}
