package iii.org.statist.model;

import java.util.List;



public class BoxOfficeService {
	private BoxOfficeDAO_Interface dao;

	public BoxOfficeService() {
		dao = new BoxOfficeDAO();
	}

	
	public Integer getBoxOfficeByMovieWithDate(Integer movieId, String start, String end){
		Integer statistData = dao.getBoxOfficePerDayInMovie(movieId, start, end);
		return statistData;
	}
	
	public Integer getSoldSeat(Integer movieId, String start, String end){
		Integer statistData = dao.getSoldSeatNumberPerDay(movieId, start, end);
		return statistData;
	}	
	
	public Integer getTotalSeat(Integer movieId, String start, String end){
		Integer statistData = dao.getAllSeatNumberPerDay(movieId, start, end);
		return statistData;
	}		
	
	public List<Integer> getMovieInPeroid (String start, String end){
		List<Integer> movies = dao.getMoviesInPeriod(start, end);
		return movies;
	}
}
