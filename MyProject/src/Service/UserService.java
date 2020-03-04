package Service;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DAO.UserDAO;
import DAO.UserInterface;
import Servlet.User;
import Servlet.PaymentHistory;


public class UserService {
	
	
	public boolean login(String name, String pwd) {
		boolean result = false;
		User us = null;
		Connection con = null;
		try {
			con = DBconn.getConn();
			con.setAutoCommit(false);
			UserInterface user = new UserDAO();
			us = user.selectAll(name,pwd);
			if(us != null){
				result = true;
			}
			con.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			DBconn.closeAll(con,null, null);
		}
		
		return result;
	}

	
	public void regist(User u) {
		User us = null;
		Connection con = null;
		try {
			con = DBconn.getConn();
			con.setAutoCommit(false);
			UserInterface user = new UserDAO();
			us = user.insertUser(u);
			
			con.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//return false;
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			DBconn.closeAll(con,null, null);
		}
	}
	
	
	public void upload(PaymentHistory ph) {
		Connection con = null;
		try {
			con = DBconn.getConn();
			con.setAutoCommit(false);
			
			UserInterface user = new UserDAO();
			user.inserDeveloper(ph);
			
			con.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//return false;
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			DBconn.closeAll(con,null, null);
		}
	}
	
	public void useapp(PaymentHistory ph) {
		Connection con = null;
		try {
			con = DBconn.getConn();
			con.setAutoCommit(false);
			
			UserInterface user = new UserDAO();
			user.inserHistory(ph);
			
			con.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//return false;
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			DBconn.closeAll(con,null, null);
		}
	}
	
	
	
	
	public boolean checkuser(String name) {
		boolean result = false;
		User us = null;
		Connection con = null;
		try {
			con = DBconn.getConn();
			con.setAutoCommit(false);
			UserInterface user = new UserDAO();
			us = user.selectName(name);
			if(us != null){
				result = true;
			}
			con.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			DBconn.closeAll(con,null, null);
		}
		
		return result;
	}
	
	public List<PaymentHistory> displayPH(String name) {
		//boolean result = false;
		//PaymentHistory ph = null;
		Connection con = null;

		List<PaymentHistory> hist = new ArrayList<PaymentHistory>();
		try {
			con = DBconn.getConn();
			con.setAutoCommit(false);
			UserInterface user = new UserDAO();
			hist = user.selectPaymentHistory(name);
			con.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			DBconn.closeAll(con,null, null);
		}
		
		return hist;
	}
	
	
	public List<PaymentHistory> displayApp() {
		//boolean result = false;
		//PaymentHistory ph = null;
		Connection con = null;

		List<PaymentHistory> hist = new ArrayList<PaymentHistory>();
		try {
			con = DBconn.getConn();
			con.setAutoCommit(false);
			UserInterface user = new UserDAO();
			hist = user.selectApp();
/*			if(hist != null){


			}*/
			con.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			DBconn.closeAll(con,null, null);
		}
		
		return hist;
	}
	
	
	public void minus(String name) {
		User us = null;
		Connection con = null;
		try {
			con = DBconn.getConn();
			con.setAutoCommit(false);
			UserInterface user = new UserDAO();
			us = user.minusPeanut(name);
			
			con.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//return false;
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			

			DBconn.closeAll(con,null, null);
		}
	}
	
	
	public void add(String name) {
		User us = null;
		Connection con = null;
		try {
			con = DBconn.getConn();
			con.setAutoCommit(false);
			UserInterface user = new UserDAO();
			us = user.addPeanut(name);
			
			con.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//return false;
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			

			DBconn.closeAll(con,null, null);
		}
	}
	
	public User showpeanuts(String name) {
		User us = null;
		Connection con = null;
		try {
			con = DBconn.getConn();
			con.setAutoCommit(false);
			UserInterface user = new UserDAO();
			us = user.selectName(name);
			con.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			DBconn.closeAll(con,null, null);
		}
		return us;
		
	}
	
	
	
	
	

}
