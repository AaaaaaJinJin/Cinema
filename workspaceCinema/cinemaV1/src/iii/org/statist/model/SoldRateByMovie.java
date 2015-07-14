package iii.org.statist.model;

import java.util.Date;

public class SoldRateByMovie {
	private Integer movieId ;
	private String movieName;
	private Double soldRate ;
	private Date showDate;
	public Integer getMovieId() {
		return movieId;
	}
	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public Double getSoldRate() {
		return soldRate;
	}
	public void setSoldRate(Double soldRate) {
		this.soldRate = soldRate;
	}
	public Date getShowDate() {
		return showDate;
	}
	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}
	
	
}
