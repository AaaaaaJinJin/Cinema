package iii.org.init;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GlobalService {
	public static final String SYSTEM_NAME = "cinemaV1";
	public static final String ADMIN_SYSTEM_NAME ="Cinema 管理系統";
	public static final String SYSTEM_ROOT = "/" + SYSTEM_NAME ;
	public static final String JNDI_DB_NAME = "java:comp/env/jdbc/CinemaDataSQLver";
	public static final String  UPLOAD_DIR = "moviepicture";
	
	  // get connect
	  private static DataSource ds = null; 	  
	  
	  static { 
			  try { 
			      Context ctx = new  InitialContext(); 
			  	  ds = (DataSource) ctx.lookup(JNDI_DB_NAME);
			  } catch (NamingException e) {
				  e.printStackTrace(); 
			  } 
		  }
	  
	  public static DataSource getDataSource() {
		  return ds;
	  }
	 	
	  // get the system Name
	  public String getSystemName() {
		  return SYSTEM_NAME;
	  }	  
}
