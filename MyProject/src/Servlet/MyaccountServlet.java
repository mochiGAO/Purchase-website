package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.UserService;

/**
 * Servlet implementation class MyaccountServlet
 */
@WebServlet("/MyAccount")
public class MyaccountServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<PaymentHistory> history = new ArrayList<PaymentHistory>();
		UserService service = new UserService();
		String name;
		HttpSession session = request.getSession();
		name = (String) session.getAttribute("Susrname");
		//System.out.println(name);
		history = service.displayPH(name);
		int showP = service.showpeanuts(name).getPeanuts();
		//System.out.println(history);
		session.setAttribute("showPeanuts", showP);
		
		System.out.println(showP);
		
		if(history!=null){


			
			request.setAttribute("histlist", history);
			request.getRequestDispatcher("/MyAccount.jsp").forward(request, response);

		}else{
			request.getRequestDispatcher("/MyAccount?err=200.jsp").forward(request, response);
			
		}
	}

}
