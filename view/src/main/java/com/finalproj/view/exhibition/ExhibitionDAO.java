package com.finalproj.view.exhibition;
import java.util.Collection;
import java.util.List;
public interface ExhibitionDAO {
	int insert(ExhibitionDTO ex);
	ExhibitionDTO view(int exhibition_no);
	int getTotal(String keyword);
	Collection<ExhibitionDTO> list(int startRow, int endRow, String keyword);
	ExhibitionDTO select(int exhibition_no);
	int update(ExhibitionDTO ex);
	int delete(int exhibition_no);
	void likeCntUp(int exhibition_no);
	void likeCntDown(int exhibition_no);
	void autoDelete();
	Collection<ExhibitionDTO> compList(int startRow, int rowPerPage, String[] tags);
	int getCompTotal(String[] tags);
	Collection<ExhibitionDTO> bizList(int startRow, int rowPerPage, String b_id);
}