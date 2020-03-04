package DAO;

import java.sql.Timestamp;
import java.util.List;

import Servlet.User;
import Servlet.PaymentHistory;

//import src.Servlet.Users;

public interface UserInterface {
	
	public User selectAll(String name,String pwd);
	
	public User insertUser(User u);

	public User selectName(String name);
	
	public List<PaymentHistory> selectPaymentHistory(String name);
	public PaymentHistory inserDeveloper(PaymentHistory ph);
	public PaymentHistory inserHistory(PaymentHistory ph);
	public List<PaymentHistory> selectApp();
	
	public User minusPeanut(String name);
	public User addPeanut(String name);
}
