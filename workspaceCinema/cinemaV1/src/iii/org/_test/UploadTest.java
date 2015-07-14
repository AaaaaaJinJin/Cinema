package iii.org._test;


import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class UploadTest
 */
@WebServlet("/upload.do")
@MultipartConfig

public class UploadTest extends HttpServlet {
	  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	 /*
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 為了處理中文檔名
	    PrintWriter out = response.getWriter();
	
	    String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
	    Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
	    String fileName = getFileName(filePart);
	    InputStream fileContent = filePart.getInputStream();
	    out.println("success");
	}

	private static String getFileName(Part part) {
	    for (String cd : part.getHeader("content-disposition").split(";")) {
	        if (cd.trim().startsWith("filename")) {
	            String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	            return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
	        }
	    }
	    return null;
	} */
	   
}


