package com.finalproj.view.exhibition;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExhibitionDAOImpl implements ExhibitionDAO {
	@Autowired
	private SqlSessionTemplate sst;
}
