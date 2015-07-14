package iii.org.movie.model;

import java.io.FileNotFoundException;
import java.sql.Date;
import java.util.List;

public class MovieService {

	private MovieDAO_Interface dao;

	public MovieService() {
		dao = new MovieDAO();
	}

	//name,eName,actors,director,company,showLength,movieRating,movieType,image,debutDate,status
	public MovieVO addMovie(String name, String eName,String actors, String director,String company,
			String showLength, String movieRating, String movieType ,String image , Date debutDate, String status) throws FileNotFoundException {
		MovieVO movieVO = new MovieVO();
		// movieId from DB
		movieVO.setName(name);
		movieVO.seteName(eName);
		movieVO.setActors(actors);
		movieVO.setDirector(director);
		movieVO.setCompany(company);
		movieVO.setShowLength(showLength);
		movieVO.setMovieRating(movieRating);
		movieVO.setMovieType(movieType);
		movieVO.setImage(image);
		movieVO.setDebutDate(debutDate);
		movieVO.setStatus(status);	
		dao.insert(movieVO);
		return movieVO;
	}
	
	public MovieVO updateMovie(String name, String eName,String actors, String director,String company,
			String showLength, String movieRating, String movieType ,String image , Date debutDate, String status, Integer movieId) {
			MovieVO movieVO = new MovieVO();
			// movieId for update DB
			movieVO.setMovieId(movieId);
			movieVO.setName(name);
			movieVO.seteName(eName);
			movieVO.setActors(actors);
			movieVO.setDirector(director);
			movieVO.setCompany(company);
			movieVO.setShowLength(showLength);
			movieVO.setMovieRating(movieRating);
			movieVO.setMovieType(movieType);
			movieVO.setImage(image);
			movieVO.setDebutDate(debutDate);
			movieVO.setStatus(status);	
 			dao.update(movieVO);
			return movieVO;
		}

	
	public void deleteMovie(int movieId) {
			dao.delete(movieId);
		} 

	public MovieVO queryByID(int movieId) {
			MovieVO movie = dao.findByPrimaryKey(movieId);		
			return movie;
		}	

	public List<MovieVO> queryByName(String MovieName) {
		List<MovieVO> movies = dao.queryByName(MovieName);			
		return movies;
	}			
	
	public List<MovieVO> queryAll() {
			List<MovieVO> movies = dao.query_All();			
			return movies;
		}		
	
	public MovieVO queryNewest() {
		MovieVO movie = dao.findNewest();		
		return movie;
	}			
	

	/*
	//for image 2 
	public void addImage(Integer movieId,String path) {
		MovieDAO_Image daoI = new MovieDAO_Image();
		try {
			daoI.insertImage(path, movieId);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}*/
}
