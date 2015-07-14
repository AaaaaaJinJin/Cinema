package iii.org.ticket.model;


public class TicketVO {
	
	// seatX,seatY,showId,screenId,ticketTypeId,orderNo,status
	private Integer seatX;
	private Integer seatY;
	private Integer showId;
	private Integer screenId;
	private Integer ticketTypeId;
	private Integer orderNo;
	private String status;
	public Integer getSeatX() {
		return seatX;
	}
	public void setSeatX(Integer seatX) {
		this.seatX = seatX;
	}
	public Integer getSeatY() {
		return seatY;
	}
	public void setSeatY(Integer seatY) {
		this.seatY = seatY;
	}
	public Integer getShowId() {
		return showId;
	}
	public void setShowId(Integer showId) {
		this.showId = showId;
	}
	public Integer getScreenId() {
		return screenId;
	}
	public void setScreenId(Integer screenId) {
		this.screenId = screenId;
	}
	public Integer getTicketTypeId() {
		return ticketTypeId;
	}
	public void setTicketTypeId(Integer ticketTypeId) {
		this.ticketTypeId = ticketTypeId;
	}
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
