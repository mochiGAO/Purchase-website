package Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import Service.UserService;

/**
 * Servlet implementation class UploadServlet
 */
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String UPLOAD_DIRECTORY = "upload";

	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (!ServletFileUpload.isMultipartContent(request)) {

			PrintWriter writer = response.getWriter();
			writer.println("Error:dont include:enctype=multipart/form-data");
			writer.flush();
			return;
		}

		DiskFileItemFactory factory = new DiskFileItemFactory();

		factory.setSizeThreshold(MEMORY_THRESHOLD);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);

		upload.setHeaderEncoding("UTF-8");
//         getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
		File file = new File(getServletContext().getRealPath("/"));
//        String uploadPath =file.getParentFile().getParent();
		String uploadPath = file.getParent();

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		String appname=null;
		String app=null;
		
		try {

			List<FileItem> formItems = upload.parseRequest(new ServletRequestContext(request));
			if (formItems != null && formItems.size() > 0) {
				for (FileItem item : formItems) {
					if (!item.isFormField()) {

						String fileName = new File(item.getName()).getName();
						appname = fileName;
						String filePath = uploadPath + File.separator + fileName;

						File storeFile = new File(filePath);
						
						
						String developer ;
						System.out.println(appname);
						UserService service = new UserService();
						HttpSession session = request.getSession();
						developer = (String) session.getAttribute("Susrname");
						
						appname = appname.substring(0,appname.indexOf("."));
						
						//session.setAttribute("app", appname);
						service.upload(new PaymentHistory(developer, appname));
						service.add(developer);

						System.out.println(filePath);
						item.write(storeFile);
						request.setAttribute("message", "upload success!" + "<br>save to the" + filePath);
					}
				}
			}

		} catch (Exception ex) {
			request.setAttribute("message", "upload fail: " + ex.getMessage());
		}
		getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
	}

}
