package Servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.UserService;

public class LoginServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name = request.getParameter("JSPusrname");
		String password = request.getParameter("JSPpsw");
	
		UserService us = new UserService();
		boolean loginSuccess = us.login(name, password);
		if(loginSuccess){
			HttpSession session = request.getSession();
			session.setAttribute("Susrname", name);
			request.getRequestDispatcher("/Index.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
			
		}
	}
}
