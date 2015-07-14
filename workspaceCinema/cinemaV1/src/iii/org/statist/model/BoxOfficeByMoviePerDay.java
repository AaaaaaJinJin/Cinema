package iii.org.statist.model;

import java.util.Date;

public class BoxOfficeByMoviePerDay {
	private Integer movieId ;
	private String movieName;
	private Integer boxOffice ;
	private Date showDate;
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public Integer getBoxOffice() {
		return boxOffice;
	}
	public void setBoxOffice(Integer boxOffice) {
		this.boxOffice = boxOffice;
	}
	public Date getShowDate() {
		return showDate;
	}
	public void setShowDate(Date date) {
		this.showDate = date;
	}
	public Integer getMovieId() {
		return movieId;
	}
	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}
	
	
}
