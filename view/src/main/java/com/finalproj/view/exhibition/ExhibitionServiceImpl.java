package com.finalproj.view.exhibition;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {
	@Autowired
	private ExhibitionDAO ed;

	public int insert(ExhibitionDTO ex) {
		return ed.insert(ex);
	}
	public ExhibitionDTO view(int exhibition_no) {
		return ed.view(exhibition_no);
	}
	public int getTotal(String keyword) {
		return ed.getTotal(keyword);
	}
	public Collection<ExhibitionDTO> list(int startRow, int endRow, String keyword, String alignment) {
		return ed.list(startRow, endRow, keyword, alignment);
	}
	public ExhibitionDTO select(int exhibition_no) {
		return ed.select(exhibition_no);
	}
	public int update(ExhibitionDTO ex) {
		return ed.update(ex);
	}
	public int delete(int exhibition_no) {
		return ed.delete(exhibition_no);
	}
	public void likeCntUp(int exhibition_no) {
		ed.likeCntUp(exhibition_no);
	}
	public void likeCntDown(int exhibition_no) {
		ed.likeCntDown(exhibition_no);
	}
	public void autoDelete() {
		ed.autoDelete();
	}
	public Collection<ExhibitionDTO> compList(int startRow, int rowPerPage, String[] tags, String alignment) {
		return ed.compList(startRow, rowPerPage, tags, alignment);
	}
	public int getCompTotal(String[] tags) {
		return ed.getCompTotal(tags);
	}
	public Collection<ExhibitionDTO> recentList(int i, int j) {
		return ed.recentList(i, j);
	}
	public Collection<ExhibitionDTO> bizList(int startRow, int rowPerPage, String b_id) {
		return ed.bizList(startRow, rowPerPage, b_id);
	}
	public Collection<ExhibitionDTO> listByCmt(int[] exNos) {
		return ed.listByCmt(exNos);
	}
	public void comment_cntUp(int exhibition_no) {
		ed.comment_cntUp(exhibition_no);
		
	}
}