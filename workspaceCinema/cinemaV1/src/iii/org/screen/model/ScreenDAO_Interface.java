package iii.org.screen.model;


import java.util.List;

public interface ScreenDAO_Interface {
	
//	這些方法用不到
//	public void insert(ScreenVO screen);
//
//	public void update(ScreenVO screen);
//
//	public void delete(Integer screenID);

	public ScreenVO findByPrimaryKey(Integer screenID);

	public List<ScreenVO> query_All();


}
