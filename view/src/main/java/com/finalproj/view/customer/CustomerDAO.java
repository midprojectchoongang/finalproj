package com.finalproj.view.customer;

import java.util.List;

public interface CustomerDAO {

	CustomerDTO select(String c_id);

	int insert(CustomerDTO customer);

	List<CustomerDTO> list(String c_id);

}
