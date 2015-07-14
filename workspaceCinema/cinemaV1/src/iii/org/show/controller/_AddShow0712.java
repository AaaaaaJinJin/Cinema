package iii.org.show.controller;

import iii.org.movie.model.MovieService;
import iii.org.movie.model.MovieVO;
import iii.org.screen.model.ScreenService;
import iii.org.screen.model.ScreenVO;
import iii.org.show.model.ShowService;
import iii.org.show.model.ShowVO;
import iii.org.ticket.model.TicketService;
import iii.org.timerTask.TicketCreator;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Timer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class AddShow
 */
@WebServlet("/admin/show/addShow0712.do")
public class _AddShow0712 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TicketService ts = new TicketService();
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public _AddShow0712() {
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
		System.out.println("Add show start");
		ShowService ss = new ShowService();
		MovieService ms = new MovieService();
		Timer timer = new Timer();
		
		String source = request.getParameter("data");
		
		Gson gson = new Gson();
		Screen[] screenArray = gson.fromJson(source, Screen[].class);

		
	    for(Screen screen:screenArray){
	    	int movieId,screenId,ticketTypeId ;
	    	Timestamp showDate; Time startTime;Date movieDebut;
	    	screenId = screen.screenId;
	    	movieDebut = Date.valueOf(screen.date.replace('/', '-'));
 			
	    	ticketTypeId = Integer.parseInt(screen.ticketType);
	    	System.out.println(screen.screenName +"," + screen.date );
	    	for (Show show :screen.showList) {
	    		
	    		startTime = Time.valueOf(show.startt);    
		    	showDate = Timestamp.valueOf(screen.date.replace('/', '-')+" "+show.startt);
    		
	    		//更新電影狀態為即將上映
	    		movieId = Integer.parseInt(show.movieId);
	    		MovieVO movieVO = ms.queryByID(movieId);
	    		
	    		// 尚未上映的電影改為即將上映
	    		String movieStatus = movieVO.getStatus();
	    		if("尚未上映".equals(movieStatus)) {
	    			movieVO.setStatus("即將上映");	
	    			ms.updateMovie(movieVO.getName(), movieVO.geteName(), movieVO.getActors(),movieVO.getDirector(), 
	    						movieVO.getCompany(), movieVO.getShowLength(), movieVO.getMovieRating(), 
	    						movieVO.getMovieType(), movieVO.getImage(), movieVO.getDebutDate(), movieVO.getStatus(), movieId);
	    		// 電影首次播放日期為null或播放日期在今天之後，修改首映時間
	    		} else if(movieVO.getDebutDate() == null || movieVO.getDebutDate().after(new java.util.Date())){
	    			movieVO.setDebutDate(movieDebut);  		

	    			ms.updateMovie(movieVO.getName(), movieVO.geteName(), movieVO.getActors(),movieVO.getDirector(), 
	    						movieVO.getCompany(), movieVO.getShowLength(), movieVO.getMovieRating(), 
	    						movieVO.getMovieType(), movieVO.getImage(), movieVO.getDebutDate(), movieVO.getStatus(), movieId);
	    		
	    		}		    		
	    		
	    			   

	    		ss.addShow(movieId, screenId, showDate, startTime, ticketTypeId);    		
	    		
	    		System.out.println("新增:" + movieVO.getName() + "," + showDate + " at " + new java.util.Date().toLocaleString());
	    		ShowVO showVO = ss.findNewest();  		
	    		
	    		// delay 10s create tickets
	    		timer.schedule(new TicketCreator(showVO.getShowId()),10000);
	    	
	    		/*
	    		// add tickets when add shows
	    		ShowVO showVO = ss.findNewest();  		
	    		switch (showVO.getScreenId()){
	    			// 0704修正產生tikcet的程式，使用傳入參數方式改變大小廳前n排 左右個空4個位子
	    			case 200: scrTicket(showVO,3); break;
	    			case 210: scrTicket(showVO,3);break;
	    			case 220: scrTicket(showVO,6);break;
	    			case 230: scrTicket(showVO,6);break;
	    		}	
	    		*/
	    	}
	    }		
		
	    PrintWriter out = response.getWriter();
	    out.println(""); //隨便回傳東西讓ajax知道已經完成
	}
		
	// 新增該場次ticket
	@SuppressWarnings("unused")
	private void scrTicket(ShowVO showVO, int n){
		int showId = showVO.getShowId();	
		int screenId = showVO.getScreenId();
		int ticketTypeId = showVO.getTicketTypeId();				
		ScreenVO screenVO = new ScreenService().queryByID(showVO.getScreenId());
		int rowX = screenVO.getSeatX();
		int rowY = screenVO.getSeatY();	
	
		@SuppressWarnings("unused")
		int count = 0;
		for (int seatX=1 ; seatX <= rowX ; seatX++) {
			for (int seatY=1; seatY <= rowY;seatY++) {			
				// if 前n排，空下左右各4個，共8個空位
				if(seatX <= n && seatY >= rowY-7 ) {
					break;
				} else {
					ts.addTicket(seatX, seatY,showId,screenId,ticketTypeId );
					count++;
				}
			}
		}   // System.out.println("新增: "  + count +"張票");					
	}	
	
	
	/* 下為 0703以前，小廳前3排，大廳前6排 左右各空3格  
	private void scrTicketA(ShowVO showVO){
		int showId = showVO.getShowId();	
		int screenId = showVO.getScreenId();
		int ticketTypeId = showVO.getTicketTypeId();				
		ScreenVO screenVO = new ScreenService().queryByID(showVO.getScreenId());
		int rowX = screenVO.getSeatX();
		int rowY = screenVO.getSeatY();	
	
		 
		for (int seatX=1 ; seatX <= rowX ; seatX++) {
			for (int seatY=1; seatY <= rowY;seatY++) {
				if(seatX < 4 && seatY > rowY-6 ){break;}
				else {
					ts.addTicket(seatX, seatY,showId,screenId,ticketTypeId );
				}
			}
		}    					
	}	

	private void scrTicketB(ShowVO showVO){
		scrTicketA(showVO);
	}
	
	private void scrTicketC(ShowVO showVO){
		int showId = showVO.getShowId();	
		int screenId = showVO.getScreenId();
		int ticketTypeId = showVO.getTicketTypeId();				
		ScreenVO screenVO = new ScreenService().queryByID(showVO.getScreenId());
		int rowX = screenVO.getSeatX();
		int rowY = screenVO.getSeatY();	
	
		for (int seatX=1 ; seatX <= rowX ; seatX++) {
			for (int seatY=1; seatY <= rowY;seatY++) {
				if(seatX < 6 && seatY > rowY-6 ){break;}
				else {
					ts.addTicket(seatX, seatY,showId,screenId,ticketTypeId );
				}
			}
		}   		    				
	}	
	
	private void scrTicketD(ShowVO showVO){
		scrTicketC(showVO);
	}	*/
	/*處理JSON字串的JAVA bean*/
	class Screen {
		public String firstshow;
		public String screenName;
		public int screenId;
		public String date;
		public Show showList[];
		public String ticketType;
	}

	class Show {
		public String movieId;
		public String startt;
		public String endd;
		public String image;
		public String length;
		public String name;
		public String restTime;
	}	
}
