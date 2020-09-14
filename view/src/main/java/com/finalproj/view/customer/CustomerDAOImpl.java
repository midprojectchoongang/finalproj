package com.finalproj.view.customer;
import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class CustomerDAOImpl implements CustomerDAO {
	@Autowired
	private SqlSessionTemplate sst;

	public CustomerDTO select(String c_id) {
		return sst.selectOne("customerns.select", c_id);
	}
	public int insert(CustomerDTO customer) {
		return sst.insert("customerns.insert", customer);
	}
	public List<CustomerDTO> list(String c_id) {
		return sst.selectList("customerns.list", c_id);
	}
	public int update(CustomerDTO customer) {
		return sst.update("customerns.update", customer);
	}
	public int delete(String c_id) {
		return sst.delete("customerns.delete", c_id);
	}
	public int idChk(String c_id) {
		return sst.selectOne("customerns.idChk", c_id);
	}
	public int nickChk(String nickname) {
		return sst.selectOne("customerns.nickChk", nickname);
	}
	public String selectNick(String c_id) {
		return sst.selectOne("customerns.selectNick", c_id);
	}
	@Override
	public int addInt(int ex_no, String c_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("exhibition_no", ex_no+"");
		map.put("c_id", c_id);
		return sst.insert("interestns.add", map);
	}
}