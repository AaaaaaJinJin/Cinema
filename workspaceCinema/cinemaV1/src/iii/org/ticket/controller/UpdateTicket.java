package iii.org.ticket.controller;

import iii.org.init.JsonUtils;
import iii.org.ticket.model.TicketService;
import iii.org.ticket.model.TicketVO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SellTicket
 */
@WebServlet("/admin/show/updateTicket.do")
public class UpdateTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("update ticket start");
		TicketVO ticketVO = JsonUtils.json2Obj(request.getParameter("ticket"), TicketVO.class);
		TicketService ts = new TicketService();
		ts.updateTicket(ticketVO.getSeatX(), ticketVO.getSeatY(), ticketVO.getShowId(), null , ticketVO.getStatus());			
	}

}
