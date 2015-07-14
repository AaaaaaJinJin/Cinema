package iii.org.show.model;

import java.sql.Time;
import java.sql.Timestamp;


public class ShowVO {
	private Integer showId;
	private Integer movieId;	
	private Integer screenId;	
	private Timestamp showDate;
	private Time showTime;
	private Integer ticketTypeId;
	public Integer getShowId() {
		return showId;
	}
	public void setShowId(Integer showId) {
		this.showId = showId;
	}
	public Integer getMovieId() {
		return movieId;
	}
	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}
	public Integer getScreenId() {
		return screenId;
	}
	public void setScreenId(Integer screenId) {
		this.screenId = screenId;
	}
	public Timestamp getShowDate() {
		return showDate;
	}
	public void setShowDate(Timestamp showDate) {
		this.showDate = showDate;
	}
	public Time getShowTime() {
		return showTime;
	}
	public void setShowTime(Time showTime) {
		this.showTime = showTime;
	}
	public Integer getTicketTypeId() {
		return ticketTypeId;
	}
	public void setTicketTypeId(Integer ticketTypeId) {
		this.ticketTypeId = ticketTypeId;
	}

}
