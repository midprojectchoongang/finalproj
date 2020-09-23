package com.finalproj.view.customer;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDAO cd;

	public CustomerDTO select(String c_id) {
		return cd.select(c_id);
	}
	public int insert(CustomerDTO customer) {
		return cd.insert(customer);
	}
	public List<CustomerDTO> list() {
		return cd.list();
	}
	public int update(CustomerDTO customer) {
		return cd.update(customer);
	}
	public int delete(String c_id) {
		return cd.delete(c_id);
	}
	public int idChk(String c_id) {
		return cd.idChk(c_id);
	}
	public int nickChk(String nickname) {
		return cd.nickChk(nickname);
	}
	public String selectNick(String c_id) {
		return cd.selectNick(c_id);
	}
	public int addInt(int ex_no, String c_id) {
		return cd.addInt(ex_no, c_id);
	}
	public int getTotal() {
		return cd.getTotal();
	}
	public void revive(String c_id) {
		cd.revive(c_id);
		
	}
}