package iii.org.ticket.model;

import java.util.List;



public class TicketService {
	private TicketDAO_Interface dao;

	public TicketService() {
		dao = new TicketDAO();
	}
	
	// seatX,seatY,showId,screenId,ticketTypeId,orderNo,status  // orderNo,status use default, don't insert 
	public TicketVO addTicket(Integer seatX,Integer seatY, Integer showId, Integer screenId, Integer ticketTypeId){
		TicketVO ticketVO = new TicketVO();
		ticketVO.setSeatX(seatX);
		ticketVO.setSeatY(seatY);
		ticketVO.setScreenId(screenId);
		ticketVO.setShowId(showId);
		ticketVO.setTicketTypeId(ticketTypeId);
		dao.insert(ticketVO);
		return ticketVO;		
	}

	// 訂票，輸入ticket的訂單號碼，status為booked
	public TicketVO updateTicket(Integer seatX,Integer seatY, Integer showId, Integer orderNo, String status ){
		TicketVO ticketVO = new TicketVO();
		ticketVO.setSeatX(seatX);
		ticketVO.setSeatY(seatY);
		ticketVO.setShowId(showId);
		ticketVO.setOrderNo(orderNo);
		ticketVO.setStatus(status);
		dao.update(ticketVO);
		return ticketVO;						
	}	

	// 賣票， orderNo直接給Null，DAO會處理NullPointerException，改用無輸入orderNo的方式將tikcet status改為sold
	public TicketVO sellTicket(Integer seatX,Integer seatY, Integer showId, String status ){
		TicketVO ticketVO = new TicketVO();
		ticketVO.setSeatX(seatX);
		ticketVO.setSeatY(seatY);
		ticketVO.setShowId(showId);
		ticketVO.setStatus(status);
		dao.update(ticketVO);
		return ticketVO;						
	}		
	
	
	public void deleteTicket(Integer showId){
		dao.delete(showId);
	}

	public TicketVO queryByID(Integer seatX,Integer seatY,Integer showId){
		TicketVO ticketVO = dao.findByPrimaryKey(seatX, seatY, showId);
		return ticketVO;			
	}

	public List<TicketVO> queryByShow(Integer showId){
		List<TicketVO> showList = dao.queryByShow(showId);
		return showList;			
	}	
	
	public List<TicketVO> queryByALL(){
		List<TicketVO> showList = dao.query_All();
		return showList;
	}	
	
	public Integer sumSaleByDate(String start,String end){
		Integer total = dao.sumSaleByDate(start, end);
		return total;
	}	
}
