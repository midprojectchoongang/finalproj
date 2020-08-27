package com.finalproj.view.exhibition;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {
	@Autowired
	private ExhibitionDAO ed;

	

	@Override
	public Collection<ExhibitionDTO> list(ExhibitionDTO ex) {
		return ed.list(ex);
	}

	@Override
	public int insert(ExhibitionDTO ex) {
		return ed.insert(ex);
	}

	@Override
	public ExhibitionDTO view(int exhibition_no) {
		return ed.view(exhibition_no);
	}

	@Override
	public int getTotal(int exhibition_no) {
		return ed.getTotal(exhibition_no);
	}
}
