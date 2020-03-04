package database;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;

public class PlacesinfoDao {
	public void insertsearedbuilding(String username, String places) {
		Connection conn = null;
		Statement stmtStatement = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cp_team16","root","gaomengjie2018");
		String sql = "INSERT INTO searchedplace" +"(username,places) VALUES (' "+username+" ',' "+places+" ')";
		stmtStatement = conn.createStatement();
		stmtStatement.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			stmtStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<String> search(String username) {
		Connection conn = null;
		Statement stmtStatement = null;
		ResultSet rs = null;
		List<String> temp = new ArrayList<String>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cp_team16","root","gaomengjie2018");
		String sql = "SELECT places FROM searchedplace WHERE username=' "+username+" '";
		stmtStatement = conn.createStatement();
		rs = stmtStatement.executeQuery(sql);
		while (rs.next()) {
			temp.add(rs.getString(1));
			
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			stmtStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return temp;
	}
}
