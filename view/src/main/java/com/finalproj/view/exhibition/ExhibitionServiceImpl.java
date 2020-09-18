package com.finalproj.view.exhibition;

import java.util.Collection;
import java.util.List;

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
	public int getTotal(String keyword) {
		return ed.getTotal(keyword);
	}

	@Override
	public Collection<ExhibitionDTO> list(int startRow, int endRow, String keyword) {
		return ed.list(startRow, endRow, keyword);
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

	@Override
	public void likeCntUp(int exhibition_no) {
		ed.likeCntUp(exhibition_no);
	}

	@Override
	public void likeCntDown(int exhibition_no) {
		ed.likeCntDown(exhibition_no);
	}

	public void autoDelete() {
		ed.autoDelete();
	}

	@Override
	public Collection<ExhibitionDTO> compList(int startRow, int rowPerPage, String[] tags) {
		return ed.compList(startRow, rowPerPage, tags);
	}

	@Override
	public int getCompTotal(String[] tags) {
		return ed.getCompTotal(tags);
	}

	@Override
	public Collection<ExhibitionDTO> bizList(int startRow, int rowPerPage, String b_id) {
		return ed.bizList(startRow, rowPerPage, b_id);
	}
}