package Servlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.UserService;

public class RegisterServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name = request.getParameter("registerusrname");
		String password = request.getParameter("registerpsw");
		
		UserService service = new UserService();
		boolean userexit = service.checkuser(name);
		if(!userexit) {
			service.regist(new User(name,password));
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		}
		else {
			
			//PrintWriter out = response.getWriter();
			request.getRequestDispatcher("/Register.jsp?err=125").forward(request, response);
		}
		
		
		
	}
}
