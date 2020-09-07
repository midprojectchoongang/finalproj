package com.finalproj.view.ticketbook;

import java.util.Collection;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketBookServiceImpl implements TicketBookService {

	@Autowired
	private TicketBookDAO tbd;

	@Override
	public int insert(TicketBookDTO ticket) {
		return tbd.insert(ticket);
	}

	@Override
	public int getTotal(String c_id) {
		return tbd.getTotal(c_id);
	}

	@Override
	public Collection<TicketBookDTO> list(TicketBookDTO tbook) {
		return tbd.list(tbook);
	}

	@Override
	public TicketBookDTO view(int ticketbook_no) {
		return tbd.view(ticketbook_no);
	}

	@Override
	public Collection<TicketBookDTO> getTicket(String c_id) {
		return tbd.getTicket(c_id);
	}

	@Override
	public int getTicket(TicketBookDTO tbook) {
		return tbd.getTicket(tbook);
	}

}
