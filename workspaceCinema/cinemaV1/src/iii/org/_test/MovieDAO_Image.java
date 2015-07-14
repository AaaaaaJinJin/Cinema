package iii.org._test;


import iii.org.init.GlobalService;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MovieDAO_Image  {
	
	public void insertImage(String path,Integer movieId) throws FileNotFoundException {
		
	
	}	

	
	public void getImage(Integer movieId,String imageName) throws IOException {
		Connection conn = null;
		PreparedStatement psts = null;
		try {

			conn = GlobalService.getDataSource().getConnection();
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
}
