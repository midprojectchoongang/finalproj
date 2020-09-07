package com.finalproj.view.ticketbook;

import java.util.Collection;
import java.util.HashMap;

public interface TicketBookService {

	int insert(TicketBookDTO ticket);

	int getTotal(String c_id);

	Collection<TicketBookDTO> list(TicketBookDTO tbook);

	TicketBookDTO view(int ticketbook_no);

	Collection<TicketBookDTO> getTicket(String c_id);


}
