package com.finalproj.view.comment;
import java.util.List;
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
}