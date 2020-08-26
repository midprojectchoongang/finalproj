package com.finalproj.view.business;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	private BusinessDAO bd;

	@Override
	public BusinessDTO select(String b_id) {
		return bd.select(b_id);
	}

	@Override
	public int insert(BusinessDTO business) {
		return bd.insert(business);
	}

	@Override
	public int getTotal() {
		return bd.getTotal();
	}

	@Override
	public Collection<BusinessDTO> list(BusinessDTO biz) {
		return bd.list(biz);
	}

	@Override
	public int update(BusinessDTO biz) {
		return bd.update(biz);
	}

	@Override
	public int delete(String b_id) {
		return bd.delete(b_id);
	}
	
  	@Override
	public int idChk(String b_id) {
		return bd.idChk(b_id);
	}
}
