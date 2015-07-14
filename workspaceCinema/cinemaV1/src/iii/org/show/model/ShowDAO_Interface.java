package iii.org.show.model;


import java.util.List;

public interface ShowDAO_Interface {

	public void insert(ShowVO show);

	public void update(ShowVO show);

	public void delete(Integer showID);

	public ShowVO findByPrimaryKey(Integer showID);

	public List<ShowVO> query_All();
	
	//
	public ShowVO findNewest();
	public List<ShowVO> queryByDate(String start,String end);
	public List<ShowVO> queryByDateTime(String startDate,String endDate, String startTime, String endTime);
}
