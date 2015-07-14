package iii.org.movie.model;


import java.util.List;

public interface MovieDAO_Interface {
	public void insert(MovieVO movieVO);
	public void update(MovieVO movieVO);
	public void delete(Integer movieID);
	public MovieVO findByPrimaryKey(Integer movieID);

	public List<MovieVO> query_All();



	// not in code method
	public List<MovieVO> queryByName(String movieName);
	public MovieVO findNewest();
	


}
