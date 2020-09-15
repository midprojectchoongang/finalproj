package com.finalproj.view.exhibition;
import java.util.Collection;
import java.util.List;
public interface ExhibitionService {
	int insert(ExhibitionDTO ex);
	ExhibitionDTO view(int exhibition_no);
	int getTotal();
	Collection<ExhibitionDTO> list(int startRow, int endRow, String keyword);
	ExhibitionDTO select(int exhibition_no);
	int update(ExhibitionDTO ex);
	int delete(int exhibition_no);
	void likeCntUp(int ex_no);
	void likeCntDown(int exhibition_no);
	void autoDelete();
	Collection<ExhibitionDTO> compList(int startRow, int rowPerPage, String[] tags);
}