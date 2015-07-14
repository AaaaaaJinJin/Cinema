package iii.org.movie.model;

import java.sql.Date;


public class MovieVO {
	//name,eName,actors,director,company,showLength,movieRating,movieType,image,debutDate,status
		
	private int movieId;
	private String name;
	private String eName;
	private String actors;
	private String director;
	private String company;	
	private String showLength;
	private String movieRating;
	private String movieType;
	private String image;
	private Date debutDate;
	private String status;

	
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public String getMovieType() {
		return movieType;
	}
	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getShowLength() {
		return showLength;
	}
	public void setShowLength(String showLength) {
		this.showLength = showLength;
	}
	public String getMovieRating() {
		return movieRating;
	}
	public void setMovieRating(String movieRating) {
		this.movieRating = movieRating;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getDebutDate() {
		return debutDate;
	}
	public void setDebutDate(Date debutDate) {
		this.debutDate = debutDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}


	
}
