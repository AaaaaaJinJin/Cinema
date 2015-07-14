package iii.org._listener;

import iii.org.movie.model.MovieService;
import iii.org.movie.model.MovieVO;
import iii.org.show.model.ShowService;
import iii.org.show.model.ShowVO;
import iii.org.ticket.model.TicketService;
import iii.org.ticket.model.TicketVO;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.List;


public class MaintainManager {
	/*
	 * 1. 找到日期在現在以前的ticket，設定status{bookable} 改為 {overtime} 2.
	 * 找到上映日期從今天到下周四的以後一周的movie，showstatus改為上映中 3.
	 */
	private final static Integer ONE_DAY = 60*60*1000*24;

	TicketService ts = new TicketService();
	ShowService ss = new ShowService();
	MovieService ms = new MovieService();
	String today = LocalDate.now().toString();
	Calendar calendar = Calendar.getInstance();
	String yesterday = new Date(calendar.getTimeInMillis() - ONE_DAY).toString();
	List<ShowVO> showList = null;

	// 找到昨天的ticket，設定status{bookable} 改為 {overtime}
	public void tickeMaintain() {
		showList = ss.queryByDate(yesterday, today);
		int countShow = 0;
		for (ShowVO show : showList) {
			List<TicketVO> ticketList = ts.queryByShow(show.getShowId());
			for (TicketVO ticket : ticketList) {
				/*//將所有的tikcet設為bookable
					ts.updateTicket(ticket.getSeatX(), ticket.getSeatY(),
						ticket.getShowId(), null, "bookable");			
				*/
				  //將過期沒賣出的票設為overtime
				if (!ticket.getStatus().equals("sold")) {
					ts.updateTicket(ticket.getSeatX(), ticket.getSeatY(),
							ticket.getShowId(), null, "overtime");
				}
			}
			countShow++;
		}
		System.out.println(countShow + "場次更新完畢");
	}

	// 找到上映日期從今天到周三movie，status改為上映中
	public void moviMaintain() {
		int count = 0;
		// 取得下周三
		do {
			calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 1);
		} while (calendar.get(Calendar.DAY_OF_WEEK) != 4);
		String lastDay = new Date(calendar.getTimeInMillis()).toString();
		
		// 先使用下一天做為判斷依據
		lastDay = new Date(calendar.getTimeInMillis() + ONE_DAY).toString();
		
		
		showList = ss.queryByDate(today, lastDay);
		for (ShowVO show : showList) {
			MovieVO movie = ms.queryByID(show.getMovieId());
			if (!movie.getStatus().equals("上映中")) {
				ms.updateMovie(movie.getName(), movie.geteName(),
						movie.getActors(), movie.getDirector(),
						movie.getCompany(), movie.getShowLength(),
						movie.getMovieRating(), movie.getMovieType(),
						movie.getImage(), movie.getDebutDate(), "上映中",
						movie.getMovieId());
				count++;
			}
		}
		System.out.println("更新 " + today + " to " + lastDay + " 電影數量: "+ count);
	}
}
