package com.finalproj.view.exhibition;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {
	@Autowired
	private ExhibitionDAO ed;

	@Override
	public int insert(ExhibitionDTO ex) {
		return ed.insert(ex);
	}

	@Override
	public ExhibitionDTO view(int exhibition_no) {
		return ed.view(exhibition_no);
	}

	@Override
	public int getTotal() {
		return ed.getTotal();
	}

	@Override
	public Collection<ExhibitionDTO> list(int startRow, int endRow) {
		return ed.list(startRow, endRow);
	}

	@Override
	public ExhibitionDTO select(int exhibition_no) {
		return ed.select(exhibition_no);
	}

	@Override
	public int update(ExhibitionDTO ex) {
		return ed.update(ex);
	}

	@Override
	public int delete(int exhibition_no) {
		return ed.delete(exhibition_no);
	}
}
