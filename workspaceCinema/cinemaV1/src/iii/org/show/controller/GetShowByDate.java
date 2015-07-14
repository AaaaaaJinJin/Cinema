package iii.org.show.controller;

import iii.org.init.JsonUtils;
import iii.org.movie.model.MovieService;
import iii.org.show.model.ShowService;
import iii.org.show.model.ShowVO;
import iii.org.ticketType.model.TicketTypeService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.sql.Timestamp;
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
@WebServlet(urlPatterns = {"/admin/show/getshowByDate.do","/admin/information/getshowByDate.do"})
public class GetShowByDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetShowByDate() {
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
		System.out.println("get shows by date start");
		response.setCharacterEncoding("utf-8");

		// call services
		MovieService ms = new MovieService();
		TicketTypeService tts = new TicketTypeService();
		// TicketService ts = new TicketService();
		ShowService ss = new ShowService();
		
		// 設定要取得的查詢時間
		String start = request.getParameter("start") + " 01:00:00";
		String end = request.getParameter("end") + " 23:59:59";
//		System.out.println(start);
//		System.out.println(end);
		
		List<ShowVO> showlist = null;
		List<Show> showList = new ArrayList<>();	

		showlist = ss.queryByDate(start, end) ;
		
		for(ShowVO showVO :showlist ){
			// List<TicketVO> tikets = ts.queryByShow(showVO.getShowId());
			
			Show show = new Show();
			show.screenId = showVO.getScreenId();
			show.showId = showVO.getShowId();
			show.movieId = showVO.getMovieId();
			show.movieName = ms.queryByID(showVO.getMovieId()).getName();
			show.movieEname = ms.queryByID(showVO.getMovieId()).geteName();
			show.movieImage = ms.queryByID(showVO.getMovieId()).getImage();
			show.length = ms.queryByID(showVO.getMovieId()).getShowLength();
			show.showDate = showVO.getShowDate();
			show.showTime = showVO.getShowTime();
			show.showType	= tts.queryByID(showVO.getTicketTypeId()).getShowType();	
			showList.add(show);
		}

		PrintWriter out = response.getWriter();
		out.println(JsonUtils.obj2Json(showList));
		out.flush();
		out.close();
		
	}
	
	@SuppressWarnings("unused")
	private class Show{
		int movieId;
		int screenId;
		int showId; 
		String length;
		String movieName;
		String movieEname;
		String movieImage;
		String screenName;		
		Timestamp showDate;
		Time showTime;
		String showType;
	}
}
