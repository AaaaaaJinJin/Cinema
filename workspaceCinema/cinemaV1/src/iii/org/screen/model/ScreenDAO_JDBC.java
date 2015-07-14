package iii.org.screen.model;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ScreenDAO_JDBC implements ScreenDAO_Interface{

	private final String QUERY_BY_PREMARYKEY = "select screenID,screenName,seatX,seatY from screen where screenID=?";
	private final String QUERY_ALL = "select screenID,screenName,seatX,seatY from screen";
	
	/*
	@Override
	public void insert(ScreenVO screen) {
		//�򥻤W���|�W�[
		
	}

	@Override
	public void update(ScreenVO screen) {
		//�򥻤W���|��s
	}

	@Override
	public void delete(Integer screenID) {
		//�򥻤W���|�R
	}*/

	@Override
	public ScreenVO findByPrimaryKey(Integer screenId) {
		ScreenVO screen = new ScreenVO();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {	
			conn = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=cinemaDB","sa", "sa123456");
			//conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_BY_PREMARYKEY);		
			psts.setInt(1, screenId);
			rs = psts.executeQuery();
			while(rs.next()) {
				screen.setScreenId(rs.getInt("screenId"));
				screen.setScreenName(rs.getString("screenName"));
				screen.setSeatX(rs.getInt("seatX"));
				screen.setSeatY(rs.getInt("seatY"));
			}
			
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		} finally {		
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}				
			if (psts != null) {
				try {
					psts.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}			
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}			
		}
		return screen; 
	}

	@Override
	public List<ScreenVO> query_All() {
		List<ScreenVO>  screenList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {	
			conn = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=cinemaDB","sa", "sa123456");
			//conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_ALL);		
	
			rs = psts.executeQuery();
			while(rs.next()) {
				ScreenVO screen = new ScreenVO();
				screen.setScreenId(rs.getInt("ScreenId"));
				screen.setScreenName(rs.getString("ScreenName"));
				screen.setSeatX(rs.getInt("seatX"));
				screen.setSeatY(rs.getInt("seatY"));
				screenList.add(screen);
			}
			
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		} finally {		
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}				
			if (psts != null) {
				try {
					psts.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}			
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}			
		}
		return screenList; 
	}
 
	public static void main(String[] args) {
		ScreenDAO_JDBC dao = new ScreenDAO_JDBC();
		List<ScreenVO> slist = dao.query_All();
		for (ScreenVO scr : slist){
			System.out.println(scr.getScreenName()+","+scr.getScreenId());
		}
	
		System.out.println("-----------------------------");
		ScreenVO srcc = dao.findByPrimaryKey(200);
		System.out.println(srcc.getScreenName()+","+srcc.getScreenId()+","+srcc.getSeatX()+","+srcc.getSeatY());
	}
	
}
