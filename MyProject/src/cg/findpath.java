
package cg;

import database.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Text;

import buildingDb.BuildinginfoDao;
import buildingDb.BuildinginfoSrvc;
import buildingDb.Buildings;

/**
 * Servlet implementation class findpath
 */
public class findpath extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String startpoint, destination,temp, encodeURL;
	private List<Buildings> staBuilding;
	private List<Buildings> endBuilding;
	private float startlat, startlng, endlat, endlng;
	private List<String> historyList;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findpath() {
        super();
        startpoint = "diamond";
        destination = "hicks";
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		startpoint = request.getParameter("startplace");
		destination = request.getParameter("destination");
		String name = request.getParameter("username");
		
		PlacesInfoSrvc pSrvc = new PlacesInfoSrvc();
		pSrvc.insert(name, destination);
		
		BuildinginfoSrvc bSrvc = new BuildinginfoSrvc();
		staBuilding = bSrvc.searchBuildings(startpoint);
		endBuilding = bSrvc.searchBuildings(destination);
		if (!staBuilding.isEmpty()) {
			startlat = staBuilding.get(0).getLatitude();
			startlng = staBuilding.get(0).getLongitude();
		}
		if (!endBuilding.isEmpty()) {
			endlat = endBuilding.get(0).getLatitude();
			endlng = endBuilding.get(0).getLongitude();
		}

		out.println("<html>");
		out.println("<head>");
		out.println("<title>Find your lecture theatre</title>");
		out.println("</head>");
		out.println("<link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">");
		out.println("<style>\r\n" + 
				"h1 { \r\n" + 
				"  display: block;\r\n" + 
				"  font-size: 2em;\r\n" + 
				"  margin-top: 0.67em;\r\n" + 
				"  margin-bottom: 0.67em;\r\n" + 
				"  margin-left: 0;\r\n" + 
				"  margin-right: 0;\r\n" + 
				"  font-weight: bold;\r\n" + 
				"  color: blue;\r\n" + 
				"}\r\n" + 
				"h2 { \r\n" + 
				"  display: block;\r\n" + 
				"  font-size: 2em;\r\n" + 
				"  margin-top: 0.67em;\r\n" + 
				"  margin-bottom: 0.67em;\r\n" + 
				"  margin-left: 0;\r\n" + 
				"  margin-right: 0;\r\n" + 
				"  font-weight: bold;\r\n" + 
				"  color: green;\r\n" + 
				"}\r\n" + 
				"</style>");
		out.println("<body>");
		out.println("<div class=\"w3-container w3-margin\" align=\"center\">");
		out.println("One marker? The place you are finding is here!");
		out.println("</div>");
		out.println("<div class=\"w3-container w3-margin\" align=\"center\">");
		out.println("<h1>");
		out.println("FROM: "+startpoint);
		out.println("</h1>");
		out.println("</div>");
		out.println("<div class=\"w3-container w3-margin\" align=\"center\">");
		out.println("<h2>");
		out.println("TO: "+destination);
		out.println("</h2>");
		out.println("</div>");
		out.println("<div class=\"w3-container w3-margin\" align=\"center\">");
		out.println("<img src=\""+"https://maps.googleapis.com/maps/api/staticmap?center="+startlat+","+startlng+"&zoom=15&size=1000x1000&maptype=roadmap\r\n" + 
				"&markers=color:blue%7Clabel:S%7C"+startlat+","+startlng+"&markers=color:green%7Clabel:D%7C"+endlat+","+endlng+"\r\n" + 
				"&path=color:0x0000ff|weight:5|geodesic:true|"+startlat+","+startlng+"|"+endlat+","+endlng+"&key=AIzaSyA2361SNJ_ailI-Ja5mU1Mg3r3gvZGqRi4"+"\" style=\"height:width: 100%;\r\n" + 
						"                              height: auto;\"/>");
		out.println("</div>");
		out.println("<div class=\"w3-container w3-margin\" align=\"center\">");
//		out.println("https://maps.googleapis.com/maps/api/staticmap?center=53.3816968,-1.4821315&zoom=16&size=500x500&maptype=roadmap&path=enc%3A"+temp+"&key=AIzaSyA2361SNJ_ailI-Ja5mU1Mg3r3gvZGqRi4");
		out.println("<button align=\"center\" class=\"w3-button w3-black\" id = \"back\" onclick=\"javascrtpt:window.location.href='/MyProject/FindLTNoJS.jsp'\">back</button>");
		out.println("</div>");
		out.println("</body>");
		out.println("</html>");
		//"https://maps.googleapis.com/maps/api/staticmap?center="+startlat+","+startlng+"&zoom=16&size=500x500&maptype=roadmap\r\n&path=color:0x0000ff|weight:5|geodesic:true|"+startlat+","+startlng+"|"+endlat+","+endlng+"&key=AIzaSyA2361SNJ_ailI-Ja5mU1Mg3r3gvZGqRi4"
	}
//color:0x0000ff|weight:5|geodesic:true|53.3816968,-1.4821315|53.380984,-1.486084
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}




