package com.finalproj.view.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDAO cd;

	@Override
	public CustomerDTO select(String c_id) {
		return cd.select(c_id);
	}

	@Override
	public int insert(CustomerDTO customer) {
		return cd.insert(customer);
	}

	@Override
	public List<CustomerDTO> list(String c_id) {
		return cd.list(c_id);
	}

	@Override
	public int update(CustomerDTO customer) {
		return cd.update(customer);
	}

	@Override
	public int delete(String c_id) {
		return cd.delete(c_id);
	}

	@Override
	public int idChk(String c_id) {
		return cd.idChk(c_id);
	}

	@Override
	public int nickChk(String nickname) {
		return cd.nickChk(nickname);
	}


}
