package iii.org.ticket.controller;

import iii.org.movie.model.MovieService;
import iii.org.movie.model.MovieVO;
import iii.org.screen.model.ScreenService;
import iii.org.screen.model.ScreenVO;
import iii.org.show.model.ShowService;
import iii.org.show.model.ShowVO;
import iii.org.ticket.model.TicketService;
import iii.org.ticket.model.TicketVO;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class movieServlet
 */
@WebServlet(urlPatterns = {"/admin/show/showticket.do"})
public class getTicketByShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getTicketByShow() {
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
		// System.out.println("showTicket start");
		response.setCharacterEncoding("utf-8");
		
		// 使用一個新的Screen類別封裝要傳出的資料，showing為電影是否上映中
		Screen screen = new Screen();
		boolean overTimeFlag = false ;

		// 準備service查詢資料
		ShowService ss = new ShowService();
		ScreenService srcS = new  ScreenService();
		MovieService ms = new MovieService();		
		TicketService ts = new TicketService();
		
		// 從前端網頁 "showticket.do?showId=xxxxx " 取得 showId
		Integer showId = Integer.parseInt(request.getParameter("showId"));
		
		// 使用showId查詢場次、螢幕、電影資料
		ShowVO showVO = ss.queryByID(showId);
		ScreenVO srcVO = srcS.queryByID(showVO.getScreenId());
		MovieVO movieVO = ms.queryByID(showVO.getMovieId());
			
		screen.movieName = movieVO.getName();
		screen.movieEname = movieVO.geteName();
		screen.movieImage = movieVO.getImage();
		screen.showDate = showVO.getShowDate().toString().substring(0,10);
		screen.showTime = showVO.getShowTime().toString().substring(0,5);
		screen.screenName = srcVO.getScreenName();
		screen.screenId = srcVO.getScreenId();
		screen.rowX = srcVO.getSeatX();
		screen.rowY = srcVO.getSeatY();
				
		// 判斷該場次時間是否已過
		Calendar now = Calendar.getInstance();
		Calendar showTime = Calendar.getInstance();
		
		// 取得該場次的年月日與時間
		String []yyyyMMdd = screen.showDate.split("-");
		Integer showYear = Integer.parseInt(yyyyMMdd[0]);
		Integer showMonth = Integer.parseInt(yyyyMMdd[1])-1;
		Integer showDate = Integer.parseInt(yyyyMMdd[2]);
		Integer showHour = Integer.parseInt(screen.showTime.split(":")[0]);
		Integer showMin = Integer.parseInt(screen.showTime.split(":")[1]);
		showTime.set(showYear, showMonth, showDate,showHour ,showMin);
		
		// showTime before now?  yes = true
		overTimeFlag = showTime.before(now);		
		


		// 查詢該場次(screenId)所有的票
		List<TicketVO> ticketList = ts.queryByShow(showId);  
		request.setAttribute("screenVO", screen);	
		request.setAttribute("overTimeFlag", overTimeFlag);	
		request.setAttribute("tickets", ticketList);	
		RequestDispatcher rd = request.getRequestDispatcher("ticket.jsp");
		rd.forward(request, response);	
		
	}
	
	public class Screen{
		String movieName;
		String movieEname;
		String movieImage;
		String showDate;
		String showTime;
		String screenName;
		Integer screenId;
		Integer rowX;
		Integer rowY;
		public String getMovieName() {
			return movieName;
		}
		public void setMovieName(String movieName) {
			this.movieName = movieName;
		}
		public String getMovieEname() {
			return movieEname;
		}
		public void setMovieEname(String movieEname) {
			this.movieEname = movieEname;
		}
		public String getMovieImage() {
			return movieImage;
		}
		public void setMovieImage(String movieImage) {
			this.movieImage = movieImage;
		}
		public String getShowDate() {
			return showDate;
		}
		public void setShowDate(String showDate) {
			this.showDate = showDate;
		}
		public String getShowTime() {
			return showTime;
		}
		public void setShowTime(String showTime) {
			this.showTime = showTime;
		}
		public String getScreenName() {
			return screenName;
		}
		public void setScreenName(String screenName) {
			this.screenName = screenName;
		}
		public Integer getScreenId() {
			return screenId;
		}
		public void setScreenId(Integer screenId) {
			this.screenId = screenId;
		}
		public Integer getRowX() {
			return rowX;
		}
		public void setRowX(Integer rowX) {
			this.rowX = rowX;
		}
		public Integer getRowY() {
			return rowY;
		}
		public void setRowY(Integer rowY) {
			this.rowY = rowY;
		}

		
		
	}
}
