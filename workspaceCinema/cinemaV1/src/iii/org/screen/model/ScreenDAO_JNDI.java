package iii.org.screen.model;

import iii.org.init.GlobalService;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ScreenDAO_JNDI implements ScreenDAO_Interface{

	private final String QUERY_BY_PREMARYKEY = "select screenID,screenName,seatX,seatY from screen where screenID=?";
	private final String QUERY_ALL = "select screenID,screenName,seatX,seatY from screen";
	
	/*
	@Override
	public void insert(ScreenVO screen) {
		//基本上不會增加
		
	}

	@Override
	public void update(ScreenVO screen) {
		//基本上不會更新
	}

	@Override
	public void delete(Integer screenID) {
		//基本上不會刪
	}*/

	@Override
	public ScreenVO findByPrimaryKey(Integer screenId) {
		ScreenVO screen = new ScreenVO();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {	
			conn = GlobalService.getDataSource().getConnection();
			//conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_BY_PREMARYKEY);		
			psts.setInt(1, screenId);
			rs = psts.executeQuery();
			while(rs.next()) {
				screen.setScreenId(rs.getInt("screenId"));
				screen.setScreenName(rs.getString("screenName"));
				screen.setSeatX(rs.getInt("SeatX"));
				screen.setSeatY(rs.getInt("SeatY"));			}
			
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
			conn = GlobalService.getDataSource().getConnection();
			//conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_ALL);		
	
			rs = psts.executeQuery();
			while(rs.next()) {
				ScreenVO screen = new ScreenVO();
				screen.setScreenId(rs.getInt("ScreenId"));
				screen.setScreenName(rs.getString("ScreenName"));
				screen.setSeatX(rs.getInt("SeatX"));
				screen.setSeatY(rs.getInt("SeatY"));

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
	
}
