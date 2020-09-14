package com.finalproj.view.customer;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproj.view.exhibition.ExhibitionDTO;

@Service
public class InterestServiceImpl implements InterestService {

	@Autowired
	private InterestDAO id;

	@Override
	public int addInt(String ex_no, String c_id) {
		return id.addInt(ex_no, c_id);
	}

	@Override
	public int removeInt(String exhibition_no, String c_id) {
		return id.removeInt(exhibition_no, c_id);
	}

	@Override
	public Collection<ExhibitionDTO> myList(String c_id) {
		return id.myList(c_id);
	}

	@Override
	public int iconChk(int exhibition_no, String c_id) {
		return id.iconChk(exhibition_no, c_id);
	}
}
