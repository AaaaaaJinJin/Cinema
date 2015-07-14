package iii.org._listener;

import iii.org.show.model.ShowService;
import iii.org.show.model.ShowVO;
import iii.org.ticket.model.TicketService;
import iii.org.ticket.model.TicketVO;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;

public class SaleTotalTimer extends Timer {
	private final static Integer ONE_DAY = 60*60*1000*24;
	private Calendar calendar = Calendar.getInstance();
	private String startDate ;
	private String endDate ;
	
	TicketService ts = new TicketService();
	ShowService ss = new ShowService();
	
	SaleTotalTimer(){
		// 取得本周四
		calendar.set(Calendar.HOUR,12);
		calendar.set(Calendar.MINUTE,0);
		calendar.set(Calendar.SECOND,0);
		while (calendar.get(Calendar.DAY_OF_WEEK) != 5) {
			calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - 1);
		} 		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		this.startDate = sdf.format(calendar.getTime());
		
		// 取得下周三
		calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 6);
		calendar.set(Calendar.HOUR,  calendar.get(Calendar.HOUR) + 23);
		calendar.set(Calendar.MINUTE,  calendar.get(Calendar.MINUTE) + 59);
		this.endDate = sdf.format(calendar.getTime());
	}
	
	public void getWeekTotal(){
		System.out.println(startDate);	
		System.out.println(endDate);	
	}
	public static void main(String[] args) {
		SaleTotalTimer stt = new SaleTotalTimer();
		stt.getWeekTotal();
	}

}
