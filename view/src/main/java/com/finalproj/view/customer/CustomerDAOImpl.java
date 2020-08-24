package com.finalproj.view.customer;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public CustomerDTO select(String c_id) {
		return sst.selectOne("customerns.select", c_id);
	}

	@Override
	public int insert(CustomerDTO customer) {
		return sst.insert("customerns.insert", customer);
	}

	@Override
	public List<CustomerDTO> list(String c_id) {
		return sst.selectList("customerns.list", c_id);
	}


}
