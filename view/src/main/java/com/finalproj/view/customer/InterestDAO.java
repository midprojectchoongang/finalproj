package com.finalproj.view.customer;

import java.util.Collection;

import com.finalproj.view.exhibition.ExhibitionDTO;

public interface InterestDAO {

	int addInt(String ex_no, String c_id);

	int removeInt(String exhibition_no, String c_id);

	Collection<ExhibitionDTO> myList(String c_id);

	int iconChk(int exhibition_no, String c_id);

}
