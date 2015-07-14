package iii.org._test;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MovieDAO_JDBC_Image  {
	
	public void insertImage(String path,Integer movieId) throws FileNotFoundException {
		Connection conn = null;
		PreparedStatement psts = null;
		try {
			conn = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=cinemaDB","sa", "sa123456");
			//conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement("update movie set movieImage=? where movieId=?");
			
			File f = new File(path);
			FileInputStream fis = new FileInputStream(f);
			
			
			psts.setBinaryStream(1,fis,f.length());
			psts.setInt(2, movieId);
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

	
	public void getImage(Integer movieId,String imageName) throws IOException {
		Connection conn = null;
		PreparedStatement psts = null;
		try {
			conn = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=cinemaDB","sa", "sa123456");
			//conn = GlobalService.getDataSource().getConnection();
			psts = conn.prepareStatement("select movieImage from movie where movieId = ?");
			
			psts.setInt(1, movieId);
			ResultSet rs = psts.executeQuery();
			if(rs.next()) {
				
				File f = new File("D:\\image\\" + imageName +".bmp");
				FileOutputStream fos = new FileOutputStream(f);				
				Blob b = rs.getBlob("movieImage");
				byte[] data = b.getBytes(1, (int)b.length());
				fos.write(data, 0, (int)b.length());
				fos.close();
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
	public static void main(String[] args) {
		MovieDAO_JDBC_Image dao = new MovieDAO_JDBC_Image();
		try {
			dao.insertImage("D:\\image\\mushroom5.png",10001);
			dao.insertImage("D:\\image\\2.jpg",10002);

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			int movieId = 10031;
			dao.getImage(10031,"image" + movieId );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
