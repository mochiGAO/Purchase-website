package Servlet;

import java.sql.Timestamp;

public class PaymentHistory {
	
	private String username;
	private String appname;
	private Timestamp time;
	public PaymentHistory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PaymentHistory(String username, String appname, Timestamp time) {
		super();
		this.username = username;
		this.appname = appname;
		this.time = time;
	}
	public PaymentHistory(String username, String appname) {
		super();
		this.username = username;
		this.appname = appname;
	}

	@Override
	public String toString() {
		return "paymentistory [username=" + username + ", appname="+ appname + ", time=" + time + "]";
	}

	public String getName() {
		return username;
	}
	public void setName(String username) {
		this.username = username;
	}
	public String getApp() {
		return appname;
	}
	public void setApp(String appname) {
		this.appname = appname;
	}
	
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}

}
