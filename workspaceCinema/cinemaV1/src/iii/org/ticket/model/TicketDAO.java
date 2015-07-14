package iii.org.ticket.model;

import iii.org.init.GlobalService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TicketDAO implements TicketDAO_Interface {
	// seatX,seatY,showId,screenId,ticketTypeId,orderNo,status
	private final String INSERT_COMMAND = "insert into ticket (seatX,seatY,showId,screenId,ticketTypeId) values (?,?,?,?,?)";
	private final String UPDATE_COMMAND = "update ticket set orderNo=?,status=? where seatX=? and seatY=? and showId=?";
	private final String UPDATE_COMMAND_JUST_STATUS = "update ticket set status=? where seatX=? and seatY=? and showId=?";
	private final String DELETE_COMMAND = "delete from ticket where showId=?";
	private final String QUERY_BY_PREMARYKEY = "select* from ticket where seatX=? and seatY=? and showId=?";
	private final String QUERY_ALL = "select* from ticket";

	private final String QUERY_BY_SHOW = "select* from ticket where showId=?";
	private final String SUM_SALE_BY_DATE = "select sum(price) from ticket a join ticketType b on a.ticketTypeId = b.ticketTypeId where showID in(select showID from show where (showDate between ?  and ?)) and status = 'sold'";

	@Override
	public void insert(TicketVO ticket) {
		Connection conn = null;
		PreparedStatement psts = null;
		try {

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(INSERT_COMMAND);
			// orderNo, status 使用database預設值，不用插入
			// seatX,seatY,showId,screenId,ticketTypeId,orderNo,status
			psts.setInt(1, ticket.getSeatX());
			psts.setInt(2, ticket.getSeatY());
			psts.setInt(3, ticket.getShowId());
			psts.setInt(4, ticket.getScreenId());
			psts.setInt(5, ticket.getTicketTypeId());
			psts.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
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
	public void update(TicketVO ticket) {
		Connection conn = null;
		PreparedStatement psts = null;

		try {

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(UPDATE_COMMAND);

			// seatX,seatY,showId,screenId,ticketTypeId,orderNo
			// only orderNo, status could be changed
			try {
				psts.setInt(3, ticket.getSeatX());
				psts.setInt(4, ticket.getSeatY());
				psts.setInt(5, ticket.getShowId());
				psts.setInt(1, ticket.getOrderNo());
				psts.setString(2, ticket.getStatus());
				psts.executeUpdate();
			} catch (NullPointerException e) {
				psts = conn.prepareStatement(UPDATE_COMMAND_JUST_STATUS);
				psts.setString(1, ticket.getStatus());
				psts.setInt(2, ticket.getSeatX());
				psts.setInt(3, ticket.getSeatY());
				psts.setInt(4, ticket.getShowId());
				psts.executeUpdate();
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

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
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
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
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
	public TicketVO findByPrimaryKey(Integer seatX, Integer seatY,
			Integer showId) {
		TicketVO ticket = new TicketVO();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_BY_PREMARYKEY);
			psts.setInt(1, seatX);
			psts.setInt(2, seatY);
			psts.setInt(3, showId);
			rs = psts.executeQuery();
			while (rs.next()) {
				ticket.setSeatX(rs.getInt("seatX"));
				ticket.setSeatY(rs.getInt("seatY"));
				ticket.setShowId(rs.getInt("showId"));
				ticket.setScreenId(rs.getInt("screenId"));
				ticket.setTicketTypeId(rs.getInt("ticketTypeId"));
				ticket.setOrderNo(rs.getInt("orderNo"));
				ticket.setStatus(rs.getString("status"));
			} // seatX,seatY,showId,screenId,ticketTypeId,orderNo,status

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
		return ticket;
	}

	@Override
	public List<TicketVO> query_All() {
		List<TicketVO> castList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_ALL);

			rs = psts.executeQuery();
			while (rs.next()) {
				TicketVO ticket = new TicketVO();
				ticket.setSeatX(rs.getInt("seatX"));
				ticket.setSeatY(rs.getInt("seatY"));
				ticket.setShowId(rs.getInt("showId"));
				ticket.setScreenId(rs.getInt("screenId"));
				ticket.setTicketTypeId(rs.getInt("ticketTypeId"));
				ticket.setOrderNo(rs.getInt("orderNo"));
				ticket.setStatus(rs.getString("status"));
				castList.add(ticket);
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

	@Override
	public List<TicketVO> queryByShow(Integer showID) {
		List<TicketVO> castList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_BY_SHOW);
			psts.setInt(1, showID);

			rs = psts.executeQuery();
			while (rs.next()) {
				TicketVO ticket = new TicketVO();
				ticket.setSeatX(rs.getInt("seatX"));
				ticket.setSeatY(rs.getInt("seatY"));
				ticket.setShowId(rs.getInt("showId"));
				ticket.setScreenId(rs.getInt("screenId"));
				ticket.setTicketTypeId(rs.getInt("ticketTypeId"));
				ticket.setOrderNo(rs.getInt("orderNo"));
				ticket.setStatus(rs.getString("status"));
				castList.add(ticket);
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
	
	@Override
	public Integer sumSaleByDate(String start,String end) {
		Integer sumTotal =0;
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;

		try {

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(SUM_SALE_BY_DATE);
			psts.setString(1, start);
			psts.setString(2, end);

			rs = psts.executeQuery();
			
			if(rs.next()){
				sumTotal = rs.getInt(1);				
			}

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
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
		return sumTotal;
	}	
	
}
