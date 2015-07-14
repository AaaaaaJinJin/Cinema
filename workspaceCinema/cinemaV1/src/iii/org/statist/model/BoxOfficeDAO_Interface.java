package iii.org.statist.model;


import java.util.List;

public interface BoxOfficeDAO_Interface {

	//
	public Integer getBoxOfficePerDayInMovie(Integer movieId, String start,String end);
	public Integer getSoldSeatNumberPerDay(Integer movieId, String start,String end);
	public Integer getAllSeatNumberPerDay(Integer movieId, String start,String end);
	
	public List<Integer> getMoviesInPeriod(String start,String end);
}
