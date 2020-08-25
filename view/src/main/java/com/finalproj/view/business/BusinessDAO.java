package com.finalproj.view.business;

import java.util.Collection;

public interface BusinessDAO {

	BusinessDTO select(String b_id);

	int insert(BusinessDTO business);

	int getTotal();

	Collection<BusinessDTO> list(BusinessDTO biz);

}
