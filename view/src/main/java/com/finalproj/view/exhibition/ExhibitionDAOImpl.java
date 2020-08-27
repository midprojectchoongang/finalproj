package com.finalproj.view.exhibition;

import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExhibitionDAOImpl implements ExhibitionDAO {
	@Autowired
	private SqlSessionTemplate sst;

	

	@Override
	public Collection<ExhibitionDTO> list(ExhibitionDTO ex) {
		return sst.selectList("exhibitionns.list", ex);
	}

	@Override
	public int insert(ExhibitionDTO ex) {
		return sst.insert("exhibitionns.insert", ex);
	}

	@Override
	public ExhibitionDTO view(int exhibition_no) {
		return sst.selectOne("exhibitionns.view", exhibition_no);
	}

	@Override
	public int getTotal(int exhibition_no) {
		return sst.selectOne("exhibitionns.getTotal", exhibition_no);
	}
}
