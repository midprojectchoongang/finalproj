package com.finalproj.view.comment;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class CommentDAOImpl implements CommentDAO {
	@Autowired
	private SqlSessionTemplate sst;

	public int cmtCount(int exhibition_no) {
		return sst.selectOne("commentns.cmtCount", exhibition_no);
	}
	public List<CommentDTO> cmtList(int exhibition_no) {
		return sst.selectList("commentns.cmtList", exhibition_no);
	}
	public int addComment(CommentDTO comment) {
		return sst.insert("commentns.addComment", comment);
	}
	public int updateComment(CommentDTO comment) {
		return sst.update("commentns.updateComment", comment);
	}
	public int deleteComment(int comment_no) {
		return sst.update("commentns.deleteComment", comment_no);
	}
	public List<CommentDTO> lotsOfCmt(int i, int j) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("i", i);
		map.put("j", j);
		return sst.selectList("commentns.lotsOfCmt", map);
	}
}