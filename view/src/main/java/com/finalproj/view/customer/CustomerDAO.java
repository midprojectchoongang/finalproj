package com.finalproj.view.customer;
import java.util.List;
public interface CustomerDAO {
	CustomerDTO select(String c_id);
	int insert(CustomerDTO customer);
	List<CustomerDTO> list(String c_id);
	int update(CustomerDTO customer);
	int delete(String c_id);
	int idChk(String c_id);
	int nickChk(String nickname);
	String selectNick(String c_id);
	int addInt(int ex_no, String c_id);
}