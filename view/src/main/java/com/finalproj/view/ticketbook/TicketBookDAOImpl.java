package com.finalproj.view.ticketbook;

import java.util.Collection;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketBookDAOImpl implements TicketBookDAO {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(TicketBookDTO ticket) {
		return sst.insert("tbookns.insert", ticket);
	}

	@Override
	public int getTotal(String c_id) {
		return sst.selectOne("tbookns.getTotal", c_id);
	}

	@Override
	public Collection<TicketBookDTO> list(TicketBookDTO tbook) {
		return sst.selectList("tbookns.list", tbook);
	}

	@Override
	public TicketBookDTO view(int ticketbook_no) {
		return sst.selectOne("tbookns.view", ticketbook_no);
	}

	@Override
	public Collection<TicketBookDTO> getTicket(String c_id) {
		return sst.selectList("tbookns.view", c_id);
	}

}
