
package Servlet;
 
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import restdao.restUserDao;
import restdao.restUserDaolmpl;
import entity.restUser;
 
public class DaFenServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String restaurantID =request.getParameter("restaurantID");
		String userSTARS = request.getParameter("userSTARS");
		String comments = request.getParameter("comments");
		
		restUser user = new restUser(); //Instantiate an object 

		user.setrestaurantID(restaurantID);
		user.setuserSTARS(userSTARS);
		user.setcomments(comments);

		
		restUserDao ud = new restUserDaolmpl();
		
		if(ud.score(user)){
			request.setAttribute("username", restaurantID);  //Place parameters in the request field
			request.setAttribute("restaurant", "Ratings success");
			request.getRequestDispatcher("ShowAll").forward(request, response);  //Forward to ShowALL page
		}else{	
			response.sendRedirect("restindex.jsp");//back to index page
		}
	}
}