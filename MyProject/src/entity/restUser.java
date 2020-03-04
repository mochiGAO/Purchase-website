package entity;
 
public class restUser {
	private int userID;
    private String restaurantID;
    private String userSTARS;
    private String comments;
	public String getrestaurantID() {
		return restaurantID;
	}
	public void setrestaurantID(String rid) {
		this.restaurantID = rid;
	}
	public String getcomments() {
		comments=comments.replace("#", "");
		comments=comments.replace("@", "");
		comments=comments.replace("$", "");
		comments=comments.replace("|", "");
		comments=comments.replace("&", "");
		return comments.replace("'", "");
	}
	public void setcomments(String com) {
		this.comments = com;
	}
	public String getuserSTARS() {
		return userSTARS;
	}
	public void setuserSTARS(String stars) {
		this.userSTARS = stars;
	}  
	public int getuserID() {
		return userID;
	}
	public void setuserID(int uid) {
		this.userID = uid;
	}
}