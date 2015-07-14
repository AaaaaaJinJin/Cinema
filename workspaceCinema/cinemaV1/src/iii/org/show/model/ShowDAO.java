package iii.org.show.model;

import iii.org.init.GlobalService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShowDAO implements ShowDAO_Interface{
	private final String INSERT_COMMAND = "insert into show values (?,?,?,?,?)";
	private final String UPDATE_COMMAND = "update show set movieId=?,screenId=? , showDate=?,showTime=? ,ticketTypeId=? where showID=?";
	private final String DELETE_COMMAND = "delete from show where showID=?";
	private final String QUERY_BY_PREMARYKEY = "select * from show where showID=?";
	private final String QUERY_ALL = "select * from show";
	private final String QUERTY_NEWEST = "select top 1 * from show order by showID desc";
	private final String QUERY_BY_DATE = "select * from show where showDate between ? and ?"; 
	private final String QUERY_BY_DATETIME = " select * from show where (showDate between ? and ?) and (showTime between ? and ?)"; 
	
	@Override
	public void insert(ShowVO show) {
		Connection conn = null;
		PreparedStatement psts = null;
		try {
			// conn = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=cinemaDB","sa", "sa123456");		
			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(INSERT_COMMAND);
			
			//showId,movieId,screenId,showDate,showTime,ticketTypeId
			psts.setInt(1, show.getMovieId());
			psts.setInt(2, show.getScreenId());
			psts.setTimestamp(3, show.getShowDate());
			psts.setTime(4, show.getShowTime());
			psts.setInt(5, show.getTicketTypeId());
			psts.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. "	+ e.getMessage());
		} finally {
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
	}

	@Override
	public void update(ShowVO show) {
		Connection conn = null;
		PreparedStatement psts = null;

		try {
			
			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(UPDATE_COMMAND);
			
			//showId,movieId,screenId,showDate,showTime,ticketTypeId
			psts.setInt(1, show.getMovieId());
			psts.setInt(2, show.getScreenId());
			psts.setTimestamp(3, show.getShowDate());
			psts.setTime(4, show.getShowTime());
			psts.setInt(5, show.getTicketTypeId());
			psts.setInt(6, show.getShowId());
			psts.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. "	+ e.getMessage());
		} finally {
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
	}

	@Override
	public void delete(Integer showId) {
		Connection conn = null;
		PreparedStatement psts = null;
		try {
			
			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(DELETE_COMMAND);
			psts.setInt(1, showId);
			psts.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. "	+ e.getMessage());
		} finally {
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
	}

	@Override
	public ShowVO findByPrimaryKey(Integer showId) {
		ShowVO show = new ShowVO();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {	
			
			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_BY_PREMARYKEY);		
			psts.setInt(1, showId);
			rs = psts.executeQuery();
			while(rs.next()) {
				show.setShowId(rs.getInt("showId"));
				show.setMovieId(rs.getInt("movieId"));
				show.setScreenId(rs.getInt("screenId"));				
				show.setShowDate(rs.getTimestamp("showDate"));
				show.setShowTime(rs.getTime("showTime"));
				show.setTicketTypeId(rs.getInt("ticketTypeId"));
			}	//showId,movieId,screenId,showDate,showTime,ticketTypeId
			
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
		return show; 
	}

	@Override
	public ShowVO findNewest() {
		ShowVO show = new ShowVO();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {	
			
			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERTY_NEWEST);		
			rs = psts.executeQuery();
			while(rs.next()) {
				show.setShowId(rs.getInt("showId"));
				show.setMovieId(rs.getInt("movieId"));
				show.setScreenId(rs.getInt("screenId"));				
				show.setShowDate(rs.getTimestamp("showDate"));
				show.setShowTime(rs.getTime("showTime"));
				show.setTicketTypeId(rs.getInt("ticketTypeId"));
			}	//showId,movieId,screenId,showDate,showTime,ticketTypeId
			
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
		return show; 
	}
	
	@Override
	public List<ShowVO> query_All() {
		List<ShowVO>  showList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {	
			
			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_ALL);		
	
			rs = psts.executeQuery();
			while(rs.next()) {
				ShowVO show = new ShowVO();
				show.setShowId(rs.getInt("showId"));
				show.setMovieId(rs.getInt("movieId"));
				show.setScreenId(rs.getInt("screenId"));				
				show.setShowDate(rs.getTimestamp("showDate"));
				show.setShowTime(rs.getTime("showTime"));
				show.setTicketTypeId(rs.getInt("ticketTypeId"));
				showList.add(show);
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
		return showList; 
	}

	
	@Override
	public List<ShowVO> queryByDate(String start,String end) {
		List<ShowVO>  showList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {	
			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_BY_DATE);		
			psts.setString(1, start );
			psts.setString(2, end);

			rs = psts.executeQuery();
			while(rs.next()) {
				ShowVO show = new ShowVO();
				show.setShowId(rs.getInt("showId"));
				show.setMovieId(rs.getInt("movieId"));
				show.setScreenId(rs.getInt("screenId"));				
				show.setShowDate(rs.getTimestamp("showDate"));
				show.setShowTime(rs.getTime("showTime"));
				show.setTicketTypeId(rs.getInt("ticketTypeId"));
				showList.add(show);
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
		return showList; 
	}	

	@Override
	public List<ShowVO> queryByDateTime(String startDate,String endDate,String startTime, String endTime) {
		List<ShowVO>  showList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {	
			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_BY_DATETIME);		
			psts.setString(1, startDate );
			psts.setString(2, endDate);
			psts.setString(3, startTime );
			psts.setString(4, endTime);
			
			
			rs = psts.executeQuery();
			while(rs.next()) {
				ShowVO show = new ShowVO();
				show.setShowId(rs.getInt("showId"));
				show.setMovieId(rs.getInt("movieId"));
				show.setScreenId(rs.getInt("screenId"));				
				show.setShowDate(rs.getTimestamp("showDate"));
				show.setShowTime(rs.getTime("showTime"));
				show.setTicketTypeId(rs.getInt("ticketTypeId"));
				showList.add(show);
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
		return showList; 
	}		
	
}
