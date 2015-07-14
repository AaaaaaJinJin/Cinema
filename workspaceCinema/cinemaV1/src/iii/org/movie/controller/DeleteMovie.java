package iii.org.movie.controller;

import iii.org.movie.model.MovieService;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddMovie
 */
@WebServlet("/admin/movie/deleteMovie.do")
public class DeleteMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMovie() {
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
		MovieService ms = new MovieService();
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		// get the movie and movieID that's just insert
		Integer movieId =  Integer.parseInt(request.getParameter("movieId"));;
		String url = null;

		if("edit".equals(request.getParameter("type"))){		
			url = "edit.jsp";
		} else {
			url = "movie.jsp";
		}
		ms.deleteMovie(movieId);	

		out.println(url);
		out.flush();
		out.close();
	}

}
