package iii.org.movie.controller;

import iii.org.init.JsonUtils;
import iii.org.movie.model.MovieService;
import iii.org.movie.model.MovieVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class movieServlet
 */
@WebServlet(urlPatterns = {"/admin/movie/getmovies.do","/admin/show/getmovies.do"})
public class GetMovies extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMovies() {
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
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		
		MovieService ms = new MovieService();
		List<MovieVO> movieList = null;
		String search = request.getParameter("search");
			
		if(search ==null || search.trim().length() == 0) {
			movieList = ms.queryAll();
		} else {		
			movieList = ms.queryByName(search);
			if (movieList == null) {
				out.println("查無資料");
			}
		}

		out.println(JsonUtils.obj2Json(movieList));
		out.flush();
		out.close();
		
		
		
	}

}


