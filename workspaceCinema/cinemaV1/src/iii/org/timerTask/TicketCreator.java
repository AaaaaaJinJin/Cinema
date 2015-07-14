package iii.org.timerTask;

import iii.org.screen.model.ScreenService;
import iii.org.screen.model.ScreenVO;
import iii.org.show.model.ShowService;
import iii.org.show.model.ShowVO;
import iii.org.ticket.model.TicketService;

import java.util.TimerTask;

public class TicketCreator extends TimerTask {
	private Integer showId;
	private ShowService ss = new ShowService();
	private TicketService ts = new TicketService();

	public TicketCreator(Integer showId) {
		this.showId = showId;
	}

	@Override
	public void run() {
		ShowVO showVO = ss.queryByID(showId);
		switch (showVO.getScreenId()) {
		// 0704修正產生tikcet的程式，使用傳入參數方式改變大小廳前n排 左右個空4個位子
		case 200:
			scrTicket(showVO, 3);
			break;
		case 210:
			scrTicket(showVO, 3);
			break;
		case 220:
			scrTicket(showVO, 6);
			break;
		case 230:
			scrTicket(showVO, 6);
			break;
		}

	}

	private void scrTicket(ShowVO showVO, int n) {
		int showId = showVO.getShowId();
		int screenId = showVO.getScreenId();
		int ticketTypeId = showVO.getTicketTypeId();
		ScreenVO screenVO = new ScreenService().queryByID(showVO.getScreenId());
		int rowX = screenVO.getSeatX();
		int rowY = screenVO.getSeatY();

		int count = 0;
		for (int seatX = 1; seatX <= rowX; seatX++) {
			for (int seatY = 1; seatY <= rowY; seatY++) {
				// if 前n排，空下左右各4個，共8個空位
				if (seatX <= n && seatY >= rowY - 7) {
					break;
				} else {
					ts.addTicket(seatX, seatY, showId, screenId, ticketTypeId);
					count++;
				}
			}
		}  System.out.println("新增: " + count +"張票 to " + showVO.getShowId() + " at " + new java.util.Date().toLocaleString());
	}
}
