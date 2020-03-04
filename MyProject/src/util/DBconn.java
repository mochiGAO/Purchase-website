package util;
 
import java.sql.*;
import entity.restUser;
 
public class DBconn {
	static String url = "jdbc:mysql://localhost:3306/cp_team16?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT"; 
	static String username = "root"; 
	static String password = "gaomengjie2018"; 
	static Connection  conn = null;
	static ResultSet rs = null;
	static PreparedStatement ps =null;
	public static void init(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,username,password);
		} catch (Exception e) {
			System.out.println("init [SQLDriver initialization failed!£¡]");
			e.printStackTrace();
		}
	}
	public static int addUpdDel(String sql){
		int i = 0;
		try {
			PreparedStatement ps =  conn.prepareStatement(sql);

			i =  ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql Database add delete change exception");
			e.printStackTrace();
		}
		
		return i;
	}
	public static ResultSet selectSql(String sql){
		try {
			ps =  conn.prepareStatement(sql);
			rs =  ps.executeQuery(sql);
		} catch (SQLException e) {
			System.out.println("sqlDatabase query exception");
			e.printStackTrace();
		}
		return rs;
	}
	public static void closeConn(){
		try {
			conn.close();
		} catch (SQLException e) {
			System.out.println("sqlDatabase shutdown exception");
			e.printStackTrace();
		}
	}
}
