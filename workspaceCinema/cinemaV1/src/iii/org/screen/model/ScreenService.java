package iii.org.screen.model;

import java.util.List;



public class ScreenService {
	private ScreenDAO_Interface dao;

	public ScreenService() {
		dao = new ScreenDAO();
	}
	
	public ScreenVO queryByID(Integer screenId){
		ScreenVO showVO = dao.findByPrimaryKey(screenId);	
		return showVO;			
	}
	
	public List<ScreenVO> queryByALL(){
		List<ScreenVO> screenList = dao.query_All();
		return screenList;
	}	
}
