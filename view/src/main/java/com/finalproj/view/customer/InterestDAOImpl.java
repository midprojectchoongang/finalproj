package com.finalproj.view.customer;

import java.util.Collection;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproj.view.exhibition.ExhibitionDTO;

@Repository
public class InterestDAOImpl implements InterestDAO {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int addInt(String ex_no, String c_id) {
		HashMap<String, String> map = new HashMap<>();
		map.put("exhibition_no", ex_no);
		map.put("c_id", c_id);
		return sst.insert("interestns.add", map);
	}

	@Override
	public int removeInt(String exhibition_no, String c_id) {
		HashMap<String, String> map = new HashMap<>();
		map.put("exhibition_no", exhibition_no);
		map.put("c_id", c_id);
		return sst.delete("interestns.remove", map);
	}

	@Override
	public Collection<ExhibitionDTO> myList(String c_id) {
		return sst.selectList("interestns.myList", c_id);
	}

	@Override
	public int iconChk(int exhibition_no, String c_id) {
		HashMap<String, String> map = new HashMap<>();
		map.put("exhibition_no", exhibition_no+"");
		map.put("c_id", c_id);
		return sst.selectOne("interestns.iconChk", map);
	}
}
