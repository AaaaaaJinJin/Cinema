package iii.org.show.controller;

import iii.org.init.JsonUtils;
import iii.org.movie.model.MovieService;
import iii.org.show.model.ShowService;
import iii.org.show.model.ShowVO;
import iii.org.ticketType.model.TicketTypeService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class movieServlet
 */
@WebServlet(urlPatterns = {"/admin/show/getshow0712.do"})
public class _GetShow0712 extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public _GetShow0712() {
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
		
		
		ShowService ss = new ShowService();
		List<ShowVO> showlist = null;
		List<Show> showList = new ArrayList<>();	

		
		showlist = ss.queryAll();
		
		
		MovieService ms = new MovieService();
		TicketTypeService ts = new TicketTypeService();
		for(ShowVO showVO :showlist ){
			Show show = new Show();
			show.screenId = showVO.getScreenId();
			show.showId = showVO.getShowId();
			show.movieName = ms.queryByID(showVO.getMovieId()).getName();
			show.movieEname = ms.queryByID(showVO.getMovieId()).geteName();
			show.movieImage = ms.queryByID(showVO.getMovieId()).getImage();
			show.showDate = showVO.getShowDate().toString();
			show.showTime = showVO.getShowTime().toString();
			show.ShowType	= ts.queryByID(showVO.getTicketTypeId()).getShowType();	
			showList.add(show);
		}
		

		out.println(JsonUtils.obj2Json(showList));
		out.flush();
		out.close();
		
	}
	
	@SuppressWarnings("unused")
	private class Show{
		int screenId;
		int showId; 
		String movieName;
		String movieEname;
		String movieImage;
		String screenName;
		String showDate;
		String showTime;
		String ShowType;
	}
}
