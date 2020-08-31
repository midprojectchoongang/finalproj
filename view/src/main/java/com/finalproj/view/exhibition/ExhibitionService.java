package com.finalproj.view.exhibition;

import java.util.Collection;

public interface ExhibitionService {

	int insert(ExhibitionDTO ex);

	ExhibitionDTO view(int exhibition_no);

	int getTotal();

	Collection<ExhibitionDTO> list(int startRow, int endRow);

	ExhibitionDTO select(int exhibition_no);

	int update(ExhibitionDTO ex);

	int delete(int exhibition_no);

}
