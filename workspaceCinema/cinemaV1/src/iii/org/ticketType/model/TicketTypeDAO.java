package iii.org.ticketType.model;

import iii.org.init.GlobalService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TicketTypeDAO implements TicketTypeDAO_Interface{
	private final String INSERT_COMMAND = "insert into ticketType values (?,?,?)";
	private final String UPDATE_COMMAND = "update ticketType set showType=?,food=? ,price=? where ticketTypeID=?";
	private final String DELETE_COMMAND = "delete from ticketType where ticketTypeID=?";
	private final String QUERY_BY_PREMARYKEY = "select ticketTypeID,showType,food,price from ticketType where ticketTypeID=?";
	private final String QUERY_ALL = "select ticketTypeID,showType,food,price from ticketType";
	
	
	@Override
	public void insert(TicketTypeVO ticketType) {
		Connection conn = null;
		PreparedStatement psts = null;
		try {
			conn = GlobalService.getDataSource().getConnection();
			//conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(INSERT_COMMAND);
				
			//ticketTypeID,showType,food,price
			psts.setString(1, ticketType.getShowType());
			psts.setString(2, ticketType.getFood());
			psts.setDouble(3, ticketType.getPrice());

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
	public void update(TicketTypeVO ticketType) {
		Connection conn = null;
		PreparedStatement psts = null;

		try {
			conn = GlobalService.getDataSource().getConnection();
			//conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(UPDATE_COMMAND);
			
			//ticketTypeID,showType,food,price
			psts.setString(1, ticketType.getShowType());
			psts.setString(2, ticketType.getFood());
			psts.setDouble(3, ticketType.getPrice());			
			psts.setInt(4, ticketType.getTypeID());

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
	public void delete( Integer  ticketTypeID) {
		Connection conn = null;
		PreparedStatement psts = null;
		try {
			conn = GlobalService.getDataSource().getConnection();
			//conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(DELETE_COMMAND);
			psts.setInt(1, ticketTypeID);
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
	public TicketTypeVO findByPrimaryKey( Integer  ticketTypeID) {
		TicketTypeVO ticketType = new TicketTypeVO();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {	
			conn = GlobalService.getDataSource().getConnection();
			//conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_BY_PREMARYKEY);		
			psts.setInt(1, ticketTypeID);
			rs = psts.executeQuery();
			while(rs.next()) {
				ticketType.setTypeID(rs.getInt("ticketTypeID"));
				ticketType.setShowType(rs.getString("showType"));
				ticketType.setFood(rs.getString("food"));		
				ticketType.setPrice(rs.getDouble("price"));		
			}	//ticketTypeID,showType,food,price
			
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
		return ticketType; 
	}

	@Override
	public List<TicketTypeVO> query_All() {
		List<TicketTypeVO>  castList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {	
			conn = GlobalService.getDataSource().getConnection();
			//conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_ALL);		
	
			rs = psts.executeQuery();
			while(rs.next()) {
				TicketTypeVO ticketType = new TicketTypeVO();
				ticketType.setTypeID(rs.getInt("ticketTypeID"));
				ticketType.setShowType(rs.getString("showType"));
				ticketType.setFood(rs.getString("food"));		
				ticketType.setPrice(rs.getDouble("price"));			
				castList.add(ticketType);
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
		return castList; 
	}
}
