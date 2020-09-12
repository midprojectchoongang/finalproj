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

	@Override
	public int insert(ExhibitionDTO ex) {
		return sst.insert("exhibitionns.insert", ex);
	}

	@Override
	public ExhibitionDTO view(int exhibition_no) {
		return sst.selectOne("exhibitionns.view", exhibition_no);
	}

	@Override
	public int getTotal() {
		return sst.selectOne("exhibitionns.getTotal");
	}

	@Override
	public Collection<ExhibitionDTO> list(int startRow, int endRow, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("startRow", startRow+"");
		map.put("endRow", endRow+"");
		map.put("keyword", keyword);
		return sst.selectList("exhibitionns.list", map);
	}

	@Override
	public ExhibitionDTO select(int exhibition_no) {
		return sst.selectOne("exhibitionns.select", exhibition_no);
	}

	@Override
	public int update(ExhibitionDTO ex) {
		return sst.update("exhibitionns.update", ex);
	}

	@Override
	public int delete(int exhibition_no) {
		return sst.delete("exhibitionns.delete", exhibition_no);
	}
}
