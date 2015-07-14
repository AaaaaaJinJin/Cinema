package iii.org.movie.controller;

import iii.org.init.GlobalService;
import iii.org.movie.model.MovieService;
import iii.org.movie.model.MovieVO;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AddMovie
 */
@MultipartConfig
@WebServlet("/admin/movie/addMovie.do")
public class AddMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMovie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("Add Movie Start");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		// 從 movie.jsp 取得影片資料  	
		// name,eName,actors,director,company,showLength,movieRating,movieType,image,debutDate,status
		String name = request.getParameter("name");
		String eName = request.getParameter("eName");
		String actors = request.getParameter("actors");
		String director = request.getParameter("director");		
		String company = request.getParameter("company");
		String movieRating = request.getParameter("movieRating");		
		String debuteDay = request.getParameter("debutDate");
		Date debutDate = null;
		String movieType = "";
		
		// movieTypes 可能有很多種，使用array處理
		String [] movieTypes= request.getParameterValues(("movieType"));		
		for(String type : movieTypes){
			movieType += type + ',';
		} movieType = movieType.substring(0, movieType.length()-1);

		// 預計上映日期
		if(debuteDay == null || debuteDay.trim().length() == 0){
			debutDate = null;
		} else {
			debutDate = Date.valueOf(debuteDay.replace('/', '-'));
		}
		
		// 上映狀態與影片長度未提供給初始值
		String status = "尚未上映";
		String showLength = request.getParameter("showLength");
		if(showLength == null || showLength.trim().length() == 0) {
			showLength = "未提供";
		} 
		
		// 準備上傳的路徑image 與檔案名稱fileName
	    String image = null;
        String fileName = null;
        // gets absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file, 上傳路徑
        String uploadFilePath = applicationPath + '/' + GlobalService.UPLOAD_DIR;	
        // creates the save directory if it does not exists
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }        
        //Get the part from request and write it to the file on server
	    Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">     	
		// call MovieService 先新增不含圖片部分資料
		MovieService ms = new MovieService();
		MovieVO movieVO = ms.addMovie(name, eName,actors, director, company, showLength, movieRating, movieType, image, debutDate, status);
		
		// get the movieID from database 取得Id作為圖片名稱
		movieVO = ms.queryNewest();
		Integer movieId = movieVO.getMovieId();
		fileName = String.valueOf(movieId);
		
		// upload the file to server and the path to database 上傳圖片
        filePart.write(uploadFilePath + '/' + fileName  + ".jpg");		// uploadFilePath/fileName.jpg
        image = GlobalService.SYSTEM_ROOT  + File.separator  + GlobalService.UPLOAD_DIR + File.separator + fileName + ".jpg";
		movieVO = ms.updateMovie(name, eName,actors, director, company, showLength, movieRating, movieType, image, debutDate, status, movieId );
		movieVO = ms.queryNewest();
		System.out.println("Add Movie:" + movieVO.getMovieId());
		//request.setAttribute("movieVO", movieVO);
		
		response.sendRedirect("movie.jsp");

	}
}
