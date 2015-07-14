package iii.org.init;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class Init
 *
 */
@WebListener
public class SetContextAttr implements ServletContextListener {
	 /**
     * Default constructor. 
     */
    public SetContextAttr() {
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
    public void contextInitialized(ServletContextEvent event)  { 
    	
    	// set web-system root
    	String systemRoot = event.getServletContext().getContextPath();
    	event.getServletContext().setAttribute("systemRoot", systemRoot);
    	
    	// set web-system name
    	String systemName = GlobalService.SYSTEM_NAME;
    	event.getServletContext().setAttribute("systemName", systemName);
 
    	// set manager-system root    	
    	String adminSystemRoot = event.getServletContext().getContextPath()+"/admin";
    	event.getServletContext().setAttribute("adminSystemRoot", adminSystemRoot);
    			
    	// set manager-system name
    	String adminSystemName = GlobalService.ADMIN_SYSTEM_NAME;
    	event.getServletContext().setAttribute("adminSystemName", adminSystemName);
    }
	
}
