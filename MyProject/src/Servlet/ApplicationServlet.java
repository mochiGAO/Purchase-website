package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.UserService;

/**
 * Servlet implementation class ApplicationServlet
 */
@WebServlet("/ApplicationServlet")
public class ApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplicationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user; 
		HttpSession session = request.getSession();
		String appname =request.getParameter("appname");

		UserService service = new UserService();			
		user = (String) session.getAttribute("Susrname");
		session.setAttribute("app", appname);	
		
		service.useapp(new PaymentHistory(user,appname));	
		service.minus(user);
		

		
		request.getRequestDispatcher("/"+appname+".jsp").forward(request, response);
	}



}
