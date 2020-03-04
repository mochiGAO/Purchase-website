package DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import Service.DBconn;
import Servlet.User;
import Servlet.PaymentHistory;

/*import com.Dao.UserDao;
import com.entity.Users;
import com.utils.JdbcUtils;*/

public class UserDAO implements UserInterface{

	@Override
	public User selectAll(String name, String pwd) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User u = null;
		
		try {
			conn = DBconn.getConn();
			String sql ="select * from users where UserName=? and UserPassword=?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, name);
			ps.setString(2, pwd);

			
			rs = ps.executeQuery();
			if(rs.next()){
				u=new User();
				u.setName(rs.getString("UserName"));
				u.setPassword(rs.getString("UserPassword"));
				u.setPeanuts(rs.getInt("Peanuts"));
			}	
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBconn.closeAll(conn, ps, rs);
		}
		return u;
	}

	
	

	@Override	
	public User selectName(String name) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User u = null;
		
		try {
			conn = DBconn.getConn();
			String sql ="select * from users where UserName=? ";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, name);
			
			rs = ps.executeQuery();
			if(rs.next()){
				u=new User();
				u.setName(rs.getString("UserName"));
				u.setPeanuts(rs.getInt("Peanuts"));
			}	
					
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBconn.closeAll(conn, ps, rs);
		}
		return u;
	}
	
	@Override
	public List<PaymentHistory> selectPaymentHistory(String name) {
		
		String appname = null;
		Timestamp time = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		PaymentHistory ph = null;
		
		List<PaymentHistory> history = new ArrayList<PaymentHistory>();
		
		try {
			conn = DBconn.getConn();
			String sql ="select * from paymenthistory where username=?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, name);
			rs = ps.executeQuery();
			while(rs.next()){
				ph=new PaymentHistory();
				ph.setName(rs.getString("username"));
				ph.setApp(rs.getString("app"));
				ph.setTime(rs.getTimestamp("date"));
				history.add(ph);		
			}	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			System.out.println("history length :"+history.size());
			
			DBconn.closeAll(conn, ps, rs);
		}
		return history;
	}
	
	
	
	
	@Override
	public List<PaymentHistory> selectApp() {
		
		String appname = null;
		Timestamp time = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		PaymentHistory ph = null;
		
		List<PaymentHistory> history = new ArrayList<PaymentHistory>();
		
		try {
			conn = DBconn.getConn();
			String sql ="select * from appdeveloper";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()){
				//System.out.println("add history 1:"+history.size());
				ph=new PaymentHistory();
				ph.setName(rs.getString("developer"));
				ph.setApp(rs.getString("app"));
				ph.setTime(rs.getTimestamp("uploaddate"));
				history.add(ph);		
			}	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//System.out.println("history length :"+history.size());
			DBconn.closeAll(conn, ps, rs);
		}
		return history;
	}
	
	/*----------------------------------------------------------------*/
	//insert
	
	@Override
	public User insertUser(User u) {
		
		PreparedStatement ps = null;
		try {
			Connection conn = DBconn.getConn();			
			String sql ="insert into users values(?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, u.getName());
			ps.setString(2, u.getPassword());
			ps.setString(3, "200");
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBconn.closeAll(null, ps, null);
		}
		return u;
	}
	
	
	@Override
	public PaymentHistory inserDeveloper(PaymentHistory ph) {
		
		PreparedStatement ps = null;
		String appname = null;
		Timestamp time = null;
		Connection conn = null;
		
		try {
			conn = DBconn.getConn();			
			String sql ="insert into appdeveloper values(?,?,default)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, ph.getName());
			ps.setString(2, ph.getApp());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBconn.closeAll(null, ps, null);
		}
		return ph;
	}
	
	
	@Override
	public PaymentHistory inserHistory(PaymentHistory ph) {
		
		PreparedStatement ps = null;
		String appname = null;
		Timestamp time = null;
		Connection conn = null;
		
		try {
			conn = DBconn.getConn();			
			String sql ="insert into paymenthistory values(?,?,default)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, ph.getName());
			ps.setString(2, ph.getApp());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBconn.closeAll(null, ps, null);
		}
		return ph;
	}
	
	
	/*----------------------------------------------------------------*/
	//update
	
	

	@Override	
	public User minusPeanut(String name) {
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		User u = null;
		
		try {
			conn = DBconn.getConn();
			
			String sql ="select *from users where UserName=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			int peanut = 0;
			if (rs.next()) {
				peanut = rs.getInt("Peanuts");
				peanut = peanut - 5;
			}
			String sql2 = "update users set Peanuts="+peanut+" where UserName='"+name+"'";
//			String sql2 ="update users set Peanuts=? where UserName=?";
			ps2 = conn.prepareStatement(sql2);
//			ps2.setInt(1, peanut);
//			ps2.setString(2, name);
			

			
			ps.execute(sql2);
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBconn.closeAll(conn, ps, rs);
		}
		return u;
	}
	
	
	@Override	
	public User addPeanut(String name) {
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		User u = null;
		
		try {
			conn = DBconn.getConn();
			
			String sql ="select *from users where UserName=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			int peanut = 0;
			if (rs.next()) {
				peanut = rs.getInt("Peanuts");
				peanut = peanut + 50;
			}
			String sql2 = "update users set Peanuts="+peanut+" where UserName='"+name+"'";
//			String sql2 ="update users set Peanuts=? where UserName=?";
			ps2 = conn.prepareStatement(sql2);
//			ps2.setInt(1, peanut);
//			ps2.setString(2, name);
			

			
			ps.execute(sql2);
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBconn.closeAll(conn, ps, rs);
		}
		return u;
	}
	
}
