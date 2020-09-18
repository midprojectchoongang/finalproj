package com.finalproj.view.exhibition;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExhibitionDAOImpl implements ExhibitionDAO {
	@Autowired
	private SqlSessionTemplate sst;

	public int insert(ExhibitionDTO ex) {
		return sst.insert("exhibitionns.insert", ex);
	}
	public ExhibitionDTO view(int exhibition_no) {
		return sst.selectOne("exhibitionns.view", exhibition_no);
	}
	public int getTotal(String keyword) {
		return sst.selectOne("exhibitionns.getTotal", keyword);
	}
	public Collection<ExhibitionDTO> list(int startRow, int endRow, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("startRow", startRow+"");
		map.put("endRow", endRow+"");
		return sst.selectList("exhibitionns.list", map);
	}
	public int getCompTotal(String[] tags) {
		Map<String, String> map = new HashMap<String, String>();
		for (int i=0; i<tags.length; i++) {
			map.put("keyword" + i, tags[i]);
		}
		return sst.selectOne("exhibitionns.getCompTotal", map);
	}
	public Collection<ExhibitionDTO> compList(int startRow, int endRow, String[] tags) {
		Map<String, String> map = new HashMap<String, String>();
		for (int i=0; i<tags.length; i++) {
			map.put("keyword" + i, tags[i]);
		}
		map.put("startRow", startRow+"");
		map.put("endRow", endRow+"");
		return sst.selectList("exhibitionns.compList", map);
	}
	public ExhibitionDTO select(int exhibition_no) {
		return sst.selectOne("exhibitionns.select", exhibition_no);
	}
	public int update(ExhibitionDTO ex) {
		return sst.update("exhibitionns.update", ex);
	}
	public int delete(int exhibition_no) {
		return sst.delete("exhibitionns.delete", exhibition_no);
	}
	public void likeCntUp(int exhibition_no) {
		sst.update("exhibitionns.likeCntUp", exhibition_no);
	}
	public void likeCntDown(int exhibition_no) {
		sst.update("exhibitionns.likeCntDown", exhibition_no);
	}
	public void autoDelete() {
		sst.delete("exhibitionns.autoDelete");
	}
	public Collection<ExhibitionDTO> recentList(int i, int j) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("i", i);
		map.put("j", j);
		return sst.selectList("exhibitionns.recentList", map);
	}
}
