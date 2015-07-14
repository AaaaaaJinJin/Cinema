package iii.org.statist.model;

import iii.org.init.GlobalService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoxOfficeDAO implements BoxOfficeDAO_Interface {
	private String GET_MOVIES_IN_PERIOD = "select distinct show.movieId  from show join movie on show.movieId = movie.movieId where (showDate between ? and ?)";
	private String GET_BOXOFFICE_IN_MOVIE = "select sum(price) from show join ticket on ticket.showId = show.showId join ticketType on ticket.ticketTypeId = ticketType.ticketTypeId  where movieId = ? and showDate between ? and ? and ticket.status = 'sold'";
	private String GET_SOLD_SEAT_IN_MOVIE = "select count(*) from show join ticket on ticket.showId = show.showId join ticketType on ticket.ticketTypeId = ticketType.ticketTypeId  where movieId = ? and showDate between ? and ? and ticket.status = 'sold'";
	private String GET_ALL_SEAT_IN_MOVIE = "select count(*) from show join ticket on ticket.showId = show.showId join ticketType on ticket.ticketTypeId = ticketType.ticketTypeId  where movieId = ? and showDate between ? and ?";

	
	@Override
	public Integer getBoxOfficePerDayInMovie(Integer movieId, String start,
			String end) {
		Integer boxOffice = 0;
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {
			
			//conn = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=cinemaDB","sa", "sa123456");
			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(GET_BOXOFFICE_IN_MOVIE);
			psts.setInt(1, movieId);
			psts.setString(2, start);
			psts.setString(3, end);
			rs = psts.executeQuery();
			while (rs.next()) {
				boxOffice = rs.getInt(1);
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

		return boxOffice;
	}

	@Override
	public List<Integer> getMoviesInPeriod(String start, String end) {
		List<Integer> movieIdList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {
			// conn =
			// DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=cinemaDB","sa",
			// "sa123456");

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(GET_MOVIES_IN_PERIOD);
			psts.setString(1, start);
			psts.setString(2, end);

			rs = psts.executeQuery();
			while (rs.next()) {
				movieIdList.add(rs.getInt(1));
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
		return movieIdList;
	}

	@Override
	public Integer getSoldSeatNumberPerDay(Integer movieId, String start,
			String end) {
		Integer boxOffice = 0;
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {
			
			//conn = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=cinemaDB","sa", "sa123456");
			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(GET_SOLD_SEAT_IN_MOVIE);
			psts.setInt(1, movieId);
			psts.setString(2, start);
			psts.setString(3, end);
			rs = psts.executeQuery();
			while (rs.next()) {
				boxOffice = rs.getInt(1);
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

		return boxOffice;
	}

	@Override
	public Integer getAllSeatNumberPerDay(Integer movieId, String start,
			String end) {
		Integer boxOffice = 0;
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {
			
			//conn = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=cinemaDB","sa", "sa123456");
			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(GET_ALL_SEAT_IN_MOVIE);
			psts.setInt(1, movieId);
			psts.setString(2, start);
			psts.setString(3, end);
			rs = psts.executeQuery();
			while (rs.next()) {
				boxOffice = rs.getInt(1);
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

		return boxOffice;
	}

//	public static void main(String[] args) {
//		BoxOfficeDAO dao = new	BoxOfficeDAO(); 
//		System.out.println(dao.getBoxOfficePerDayInMovie(10004,"2015-07-02 00:00:00","2015-07-02 23:59:59"));
//
//	}
	
}
