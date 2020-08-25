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
}
