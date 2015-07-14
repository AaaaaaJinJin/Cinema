package iii.org._listener;

import iii.org.screen.model.ScreenService;
import iii.org.screen.model.ScreenVO;
import iii.org.show.model.ShowService;
import iii.org.show.model.ShowVO;
import iii.org.ticket.model.TicketService;

import java.util.List;

public class AutoSellTicket {
	private String fromDate, toDate;
	private List<ShowVO> showList = null;
	private ShowService ss = new ShowService();
	private TicketService ts = new TicketService();

	AutoSellTicket(String fromDate, String toDate) {
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.showList = ss.queryByDate(this.fromDate, this.toDate);
	}


	public void sell() {
		for (ShowVO showVO : showList) {
			int showId = showVO.getShowId();
			ScreenVO screenVO = new ScreenService().queryByID(showVO.getScreenId());
			
			int keep = (int) (Math.random() * 50);

			
			 
			int rowX = screenVO.getSeatX();
			int rowY = screenVO.getSeatY();
			
			int count = 0;
			for (int seatX = 4; seatX <= rowX - 2; seatX++) {
				for (int seatY = 1; seatY <= rowY; seatY++) {
					if( (int) (Math.random() *50 ) > keep){
						continue;
					}
					count++;
					ts.sellTicket(seatX, seatY, showId, "sold");
				}
			}	
			 System.out.println(showId + " 自動賣票: " + count);
		}

	}


	public void reset() {
		for (ShowVO showVO : showList) {
			int showId = showVO.getShowId();
			ScreenVO screenVO = new ScreenService().queryByID(showVO
					.getScreenId());

			int rowX = screenVO.getSeatX();
			int rowY = screenVO.getSeatY();

			int count = 0;
			for (int seatX = 4; seatX <= rowX - 2; seatX++) {
				for (int seatY = 1; seatY <= rowY; seatY++) {
					count++;
					ts.sellTicket(seatX, seatY, showId, "bookable");
				}
			}
			System.out.println(showId + " 還原: " + count);
		}
	}
}
