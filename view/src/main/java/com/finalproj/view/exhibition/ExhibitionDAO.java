package com.finalproj.view.exhibition;

import java.util.Collection;

public interface ExhibitionDAO {

	

	Collection<ExhibitionDTO> list(ExhibitionDTO ex);

	int insert(ExhibitionDTO ex);

	ExhibitionDTO view(int exhibition_no);

	int getTotal(int exhibition_no);

}
