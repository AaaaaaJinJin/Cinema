package iii.org.ticketType.model;




public class TicketTypeService {
	private TicketTypeDAO_Interface dao;

	public TicketTypeService() {
		dao = new TicketTypeDAO();
	}
	
	public TicketTypeVO queryByID(Integer ticketTypeId ){
		TicketTypeVO ttVO = dao.findByPrimaryKey(ticketTypeId);
		return ttVO;			
	}
	

}
