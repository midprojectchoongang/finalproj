package com.finalproj.view.exhibition;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {
	@Autowired
	private ExhibitionDAO ed;
}
