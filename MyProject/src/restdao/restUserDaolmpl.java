package restdao;
 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
 
import entity.restUser;
import util.DBconn;
 
public class restUserDaolmpl implements restUserDao{
	
	public boolean score(restUser user) {
		boolean flag = false;
		DBconn.init();
//		String sql = "insert into score(userID,restaurantID,userSTARS,comments) values('?','?','?','?')";
		
		int i =DBconn.addUpdDel("insert into score(userID,restaurantID,userSTARS,comments) " +
				"values('"+user.getuserID()+"','"+user.getrestaurantID()+"','"+user.getuserSTARS()+"','"+user.getcomments()+"')");
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	public List<restUser> getUserAll() {
		List<restUser> list = new ArrayList<restUser>();
    	try {
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from score");
			System.out.println(rs);
			while(rs.next()){
				restUser user = new restUser();
				user.setuserID(rs.getInt("userID"));
				user.setrestaurantID(rs.getString("restaurantID"));
				user.setuserSTARS(rs.getString("userSTARS"));
			    user.setcomments(rs.getString("comments"));
				System.out.println(rs.getString("userSTARS"));
				list.add(user);
			}
			DBconn.closeConn();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}