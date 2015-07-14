package iii.org._test;


import iii.org.init.GlobalService;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetImage
 */
@WebServlet("/admin/movie/getMImage.do")
public class GetImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement psts = null;
		OutputStream os = null;
		InputStream is = null;
		
		Integer movieID = Integer.parseInt(request.getParameter("movieID"));
		try {	
			conn = GlobalService.getDataSource().getConnection();
			
			psts = conn.prepareStatement("SELECT movieImage from movie where movieID = ?");
			psts.setInt(1, movieID);
			
			ResultSet rs = psts.executeQuery();
			if (rs.next()) {
				//
				is = rs.getBinaryStream("movieImage");				
				// 
				response.setContentType("image/bmp");
				// 
				os = response.getOutputStream();				
				int count = 0;
				byte[] bytes = new byte[1024];
				while ((count = is.read(bytes)) != -1) {
					os.write(bytes, 0, count);
				}
			}			
		} catch (SQLException e) {
			throw new ServletException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close(); // 
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if (psts != null) {
				try {
					psts.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (os != null) {
				os.close();
			}
		}
		
	}


}

