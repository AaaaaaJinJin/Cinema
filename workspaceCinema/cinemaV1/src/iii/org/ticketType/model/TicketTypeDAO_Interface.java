package iii.org.ticketType.model;


import java.util.List;

public interface TicketTypeDAO_Interface {

	public void insert(TicketTypeVO ticketType);

	public void update(TicketTypeVO ticketType);

	public void delete(Integer ticketTypeID);

	public TicketTypeVO findByPrimaryKey(Integer ticketTypeID);

	public List<TicketTypeVO> query_All();


}
