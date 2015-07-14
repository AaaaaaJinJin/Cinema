package iii.org.show.model;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;



public class ShowService {
	private ShowDAO_Interface dao;

	public ShowService() {
		dao = new ShowDAO();
	}
	
	//showId,movieId,screenId,showDate,showTime,ticketTypeId
	public ShowVO addShow(Integer movieId, Integer screenId,Timestamp showDate ,Time startTime, Integer ticketTypeId){
		ShowVO showVO = new ShowVO();
		showVO.setMovieId(movieId);
		showVO.setScreenId(screenId);
		showVO.setShowDate(showDate);
		showVO.setShowTime(startTime);
		showVO.setTicketTypeId(ticketTypeId);
		dao.insert(showVO);
		return showVO;		
	}

	public ShowVO updateShow(Integer movieId, Integer screenId,Timestamp showDate ,Time startTime, Integer ticketTypeId,Integer showId){
		ShowVO showVO = new ShowVO();
		showVO.setMovieId(movieId);
		showVO.setScreenId(screenId);
		showVO.setShowDate(showDate);
		showVO.setShowTime(startTime);
		showVO.setTicketTypeId(ticketTypeId);
		showVO.setShowId(showId);
		dao.update(showVO);
		return showVO;						
	}	
	
	public void deleteShow(Integer showId){
		dao.delete(showId);
	}

	public ShowVO queryByID(Integer showId){
		ShowVO showVO = dao.findByPrimaryKey(showId);	
		return showVO;			
	}

	public ShowVO findNewest(){
		ShowVO showVO = dao.findNewest();	
		return showVO;			
	}	
	
	public List<ShowVO> queryAll(){
		List<ShowVO> showList = dao.query_All();
		return showList;
	}	
	
	public List<ShowVO> queryByDate(String start,String end){
		List<ShowVO> showList = dao.queryByDate(start, end);
		return showList;
	}		
	
}
