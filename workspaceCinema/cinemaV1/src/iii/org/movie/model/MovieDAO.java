package iii.org.movie.model;

import iii.org.init.GlobalService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO implements MovieDAO_Interface {
	// insert into movie
	// (name,eName,actors,director,company,showLength,movieRating,movieType,image,debutDate,status)
	private final String INSERT_COMMAND = "insert into movie values(?,?,?,?,?,?,?,?,?,?,?)";

	private final String UPDATE_COMMAND = "update movie set name=?, eName=?,actors=?,director=?"
			+ ",  company=?,showLength=?,movieRating=?,movieType=?,image=?,debutDate=?,status=? where movieId=?";

	private final String DELETE_COMMAND = "delete from movie where movieId=?";

	// "select movieId,name,eName,actors,director,company,showLength,movieRating,movieType,image,debutDate,status from movie where movieId = ?";
	private final String QUERY_BY_NAME = "select* from movie where name like ?";
	private final String QUERY_BY_PREMARYKEY = "select* from movie where movieId=?";
	private final String QUERY_ALL = "select * from movie";
	private final String QUERTY_NEWEST = "select top 1 * from movie order by movieId desc";

	@Override
	public void insert(MovieVO movieVO) {
		Connection conn = null;
		PreparedStatement psts = null;
		try {

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(INSERT_COMMAND);

			// name,eName,actors,director,company,showLength,movieRating,movieType,image,debutDate,status
			psts.setString(1, movieVO.getName());
			psts.setString(2, movieVO.geteName());
			psts.setString(3, movieVO.getActors());
			psts.setString(4, movieVO.getDirector());
			psts.setString(5, movieVO.getCompany());
			psts.setString(6, movieVO.getShowLength());
			psts.setString(7, movieVO.getMovieRating());
			psts.setString(8, movieVO.getMovieType());
			psts.setString(9, movieVO.getImage());
			psts.setDate(10, movieVO.getDebutDate());
			psts.setString(11, movieVO.getStatus());
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
	public void update(MovieVO movieVO) {
		Connection conn = null;
		PreparedStatement psts = null;

		try {

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(UPDATE_COMMAND);

			// name,eName,actors,director,company,showLength,movieRating,movieType,image,debutDate,status
			psts.setString(1, movieVO.getName());
			psts.setString(2, movieVO.geteName());
			psts.setString(3, movieVO.getActors());
			psts.setString(4, movieVO.getDirector());
			psts.setString(5, movieVO.getCompany());
			psts.setString(6, movieVO.getShowLength());
			psts.setString(7, movieVO.getMovieRating());
			psts.setString(8, movieVO.getMovieType());
			psts.setString(9, movieVO.getImage());
			psts.setDate(10, movieVO.getDebutDate());
			psts.setString(11, movieVO.getStatus());
			psts.setInt(12, movieVO.getMovieId());
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
	public void delete(Integer movieId) {
		Connection conn = null;
		PreparedStatement psts = null;
		try {

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(DELETE_COMMAND);
			psts.setInt(1, movieId);
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
	public MovieVO findByPrimaryKey(Integer movieId) {
		MovieVO movieVO = new MovieVO();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_BY_PREMARYKEY);
			psts.setInt(1, movieId);
			rs = psts.executeQuery();
			while (rs.next()) {
				movieVO.setMovieId(rs.getInt("movieId"));
				movieVO.setName(rs.getString("name"));
				movieVO.seteName(rs.getString("eName"));
				movieVO.setActors(rs.getString("actors"));
				movieVO.setDirector(rs.getString("director"));
				movieVO.setCompany(rs.getString("company"));
				movieVO.setShowLength(rs.getString("showLength"));
				movieVO.setMovieRating(rs.getString("movieRating"));
				movieVO.setMovieType(rs.getString("movieType"));
				movieVO.setImage(rs.getString("image"));
				movieVO.setDebutDate(rs.getDate("debutDate"));
				movieVO.setStatus(rs.getString("status"));
			}
			// name,eName,actors,director,company,showLength,movieRating,movieType,image,debutDate,status
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
		return movieVO;
	}

	@Override
	public List<MovieVO> query_All() {
		List<MovieVO> movieList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERY_ALL);

			rs = psts.executeQuery();
			while (rs.next()) {
				MovieVO movieVO = new MovieVO();
				movieVO.setMovieId(rs.getInt("movieId"));
				movieVO.setName(rs.getString("name"));
				movieVO.seteName(rs.getString("eName"));
				movieVO.setActors(rs.getString("actors"));
				movieVO.setDirector(rs.getString("director"));
				movieVO.setCompany(rs.getString("company"));
				movieVO.setShowLength(rs.getString("showLength"));
				movieVO.setMovieRating(rs.getString("movieRating"));
				movieVO.setMovieType(rs.getString("movieType"));
				movieVO.setImage(rs.getString("image"));
				movieVO.setDebutDate(rs.getDate("debutDate"));
				movieVO.setStatus(rs.getString("status"));
				movieList.add(movieVO);
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
		return movieList;
	}

	@Override
	public List<MovieVO> queryByName(String name) {
		List<MovieVO> movieList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {

			conn = GlobalService.getDataSource().getConnection();

			psts = conn.prepareStatement(QUERY_BY_NAME);
			psts.setString(1, "%" + name + "%");

			rs = psts.executeQuery();
			while (rs.next()) {
				MovieVO movieVO = new MovieVO();
				movieVO.setMovieId(rs.getInt("movieId"));
				movieVO.setName(rs.getString("name"));
				movieVO.seteName(rs.getString("eName"));
				movieVO.setActors(rs.getString("actors"));
				movieVO.setDirector(rs.getString("director"));
				movieVO.setCompany(rs.getString("company"));
				movieVO.setShowLength(rs.getString("showLength"));
				movieVO.setMovieRating(rs.getString("movieRating"));
				movieVO.setMovieType(rs.getString("movieType"));
				movieVO.setImage(rs.getString("image"));
				movieVO.setDebutDate(rs.getDate("debutDate"));
				movieVO.setStatus(rs.getString("status"));
				movieList.add(movieVO);
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
		return movieList;
	}

	@Override
	public MovieVO findNewest() {
		MovieVO movieVO = new MovieVO();
		Connection conn = null;
		PreparedStatement psts = null;
		ResultSet rs = null;
		try {

			conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement(QUERTY_NEWEST);
			rs = psts.executeQuery();
			while (rs.next()) {
				movieVO.setMovieId(rs.getInt("movieId"));
				movieVO.setName(rs.getString("name"));
				movieVO.seteName(rs.getString("eName"));
				movieVO.setActors(rs.getString("actors"));
				movieVO.setDirector(rs.getString("director"));
				movieVO.setCompany(rs.getString("company"));
				movieVO.setShowLength(rs.getString("showLength"));
				movieVO.setMovieRating(rs.getString("movieRating"));
				movieVO.setMovieType(rs.getString("movieType"));
				movieVO.setImage(rs.getString("image"));
				movieVO.setDebutDate(rs.getDate("debutDate"));
				movieVO.setStatus(rs.getString("status"));
			}
			// name,eName,actors,director,company,showLength,movieRating,movieType,image,debutDate,status
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
		return movieVO;
	}
}
