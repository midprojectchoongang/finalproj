package com.finalproj.view.business;

import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproj.view.exhibition.ExhibitionDTO;

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
	public int update(BusinessDTO biz) {
		return sst.update("businessns.update", biz);
	}

	@Override
	public int delete(String b_id) {
		return sst.delete("businessns.delete", b_id);
	}
	
  	@Override  
	public int idChk(String b_id) {
		return sst.selectOne("businessns.idChk", b_id);
	}

	@Override
	public int joinConfirm(BusinessDTO business) {
		return sst.update("businessns.joinConfirm", business);
	}
}
