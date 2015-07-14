package iii.org.ticket.model;


import java.util.List;

public interface TicketDAO_Interface {

	public void insert(TicketVO ticket);

	public void update(TicketVO ticket);
	
	public void delete(Integer showID);

	public TicketVO findByPrimaryKey(Integer seatX,Integer seatY, Integer showID);
	
	public List<TicketVO> query_All();
	
	//
	public List<TicketVO> queryByShow(Integer showID);
	public Integer sumSaleByDate(String start,String end);
}
