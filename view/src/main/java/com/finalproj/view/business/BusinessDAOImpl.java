package com.finalproj.view.business;

import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BusinessDAOImpl implements BusinessDAO {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public BusinessDTO select(String b_id) {
		return sst.selectOne("businessns.select", b_id);
	}

	@Override
	public int insert(BusinessDTO business) {
		return sst.insert("businessns.insert", business);
	}

	@Override
	public int getTotal() {
		return sst.selectOne("businessns.getTotal");
	}

	@Override
	public Collection<BusinessDTO> list(BusinessDTO biz) {
		return sst.selectList("businessns.list", biz);
	}

	@Override
	public int idChk(String b_id) {
		return sst.selectOne("businessns.idChk", b_id);
	}
}
