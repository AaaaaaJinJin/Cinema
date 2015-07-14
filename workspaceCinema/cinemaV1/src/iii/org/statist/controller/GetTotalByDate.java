package iii.org.statist.controller;

import iii.org.init.JsonUtils;
import iii.org.ticket.model.TicketService;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetTotalByDate
 */
@WebServlet("/admin/getTotalByDate.do")
public class GetTotalByDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTotalByDate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TicketService ts = new TicketService();
		SumData sumDate = new SumData();
		
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");

		String sunday = request.getParameter("sunday");
		String saturday = request.getParameter("saturday");		
		String monday = request.getParameter("monday");
		String tuesday = request.getParameter("tuesday");
		String wednesday = request.getParameter("wednesday");
		String friday = request.getParameter("friday");			
		String thursday = request.getParameter("thursday");
		String today = request.getParameter("today");
		

		sumDate.today = ts.sumSaleByDate(today + " 07:00:00", today + " 23:59:00");		
		sumDate.sunday = ts.sumSaleByDate(sunday + " 07:00:00",sunday + " 23:59:00");		
		sumDate.saturday = ts.sumSaleByDate(saturday + " 07:00:00",saturday + " 23:59:00");
		sumDate.monday = ts.sumSaleByDate(monday + " 07:00:00",monday + " 23:59:00");
		sumDate.tuesday = ts.sumSaleByDate(tuesday + " 07:00:00",tuesday + " 23:59:00");
		sumDate.wednesday = ts.sumSaleByDate(wednesday + " 07:00:00",wednesday + " 23:59:00");
		sumDate.friday = ts.sumSaleByDate(friday + " 07:00:00",friday + " 23:59:00");
		sumDate.thursday = ts.sumSaleByDate(thursday + " 07:00:00",thursday + " 23:59:00");
		 	
		
		out.print(JsonUtils.obj2Json(sumDate));
		out.flush();
		out.close();
	}

	@SuppressWarnings("unused")
	private class SumData{
		int today;
		int sunday;
		int monday;
		int tuesday;
		int wednesday;
		int thursday;
		int friday;
		int saturday;
	}
}
