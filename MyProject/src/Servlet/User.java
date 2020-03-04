package Servlet;

public class User {
	
	private String name;
	private String password;
	private int peanuts;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String name, String password, int peanuts) {
		super();
		this.name = name;
		this.password = password;
		this.peanuts = peanuts;
	}
	public User(String name, String password) {
		
		this.name = name;
		this.password = password;
	}
	@Override
	public String toString() {
		return "users [name=" + name + ", password="+ password + ", peanuts=" + peanuts + "]";
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getPeanuts() {
		return peanuts;
	}
	public void setPeanuts(int peanuts) {
		this.peanuts = peanuts;
	}

}
