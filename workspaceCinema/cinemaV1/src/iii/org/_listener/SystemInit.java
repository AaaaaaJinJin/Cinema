package iii.org._listener;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class SystemClock
 *
 */
@WebListener
public class SystemInit implements ServletContextListener {
	/**
     * Default constructor. 
     */
    public SystemInit() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent event)  { 
         // TODO Auto-generated method stub
    }
  
	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    @SuppressWarnings("unused")
	public void contextInitialized(ServletContextEvent event)  { 
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
    	Calendar calendar = Calendar.getInstance();
    	
    	calendar.set(Calendar.HOUR_OF_DAY,23); 	    	calendar.set(Calendar.MINUTE,59); 	
    	String todayEnd = sdf.format(calendar.getTime());     	
    	calendar.set(Calendar.HOUR_OF_DAY,1); 	    	calendar.set(Calendar.MINUTE,0); 	
    	String today = sdf.format(calendar.getTime());

    	
    	calendar.set(Calendar.DATE, calendar.get(Calendar.DATE)-1);
    	String yesterday = sdf.format(calendar.getTime());
    	
    	calendar.set(2015, Calendar.JULY, 2);
    	String j0702 = sdf.format(calendar.getTime());
    	
    	calendar.set(2015, Calendar.JULY, 2);
    	calendar.set(Calendar.HOUR_OF_DAY,23); 	    	calendar.set(Calendar.MINUTE,59); 
    	String j0702d = sdf.format(calendar.getTime());
    	
  
    	calendar.set(2015, Calendar.JULY, 5);
    	calendar.set(Calendar.HOUR_OF_DAY,1); 	  
		String fromDate = sdf.format(calendar.getTime());
		
    	calendar.set(2015, Calendar.JULY, 5);
    	calendar.set(Calendar.HOUR_OF_DAY,23); 	  	
		String toDate = sdf.format(calendar.getTime());

		 AutoSellTicket autoSell = new AutoSellTicket(fromDate,toDate);		
//		 autoSell.reset();
//		 autoSell.sell();		
		
//		 String fromDate = "2015-07-02 01:00";
//		 String toDate = "2015-07-07 23:59";
		  
		 
    	// System.out.println(fromDate);
    	// System.out.println(toDate);	

		 
		// Date date = new Date();  
		// System.out.println(date);
		
	    // MaintainManager sm  = new MaintainManager();
	    
	    // System.out.println("system start at: " +new Date().toLocaleString());
        // Timer timer = new Timer();
	    

   		   
		// AutoSellTicket autoSelld = new AutoSellTicket("2015-07-02 08:00","2015-07-15 23:00");	 
		// autoSelld.sell();
		// AutoSellTicket autoSelldd = new AutoSellTicket("2015-07-02 08:00","2015-07-15 23:00");	 
		// AutoSellTicket autoSelldd = new AutoSellTicket(today,todayEnd);	
	    // sm.tickeMaintain();
	    // sm.moviMaintain();
           
    }
	
}
