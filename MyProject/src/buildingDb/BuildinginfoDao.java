package buildingDb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BuildinginfoDao {
	public List<Buildings> getLatLng(String buildingname) {
		List<Buildings> temp = new ArrayList<Buildings>();
		Connection conn = null;
		Statement statement = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cp_team16","root","gaomengjie2018");
			String sqlString = "SELECT * FROM buildings WHERE building_name='"+buildingname+"'";
			statement = conn.createStatement();
			rs = statement.executeQuery(sqlString);
			while (rs.next()) {
				Buildings buildings = new Buildings();
				buildings.setBuildingname(rs.getString(1));
				buildings.setLatitude(rs.getFloat(2));
				buildings.setLongitude(rs.getFloat(3));
				temp.add(buildings);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			statement.close();
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
