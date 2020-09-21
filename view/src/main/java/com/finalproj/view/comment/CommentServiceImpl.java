package com.finalproj.view.comment;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDAO cd;

	public int cmtCount(int exhibition_no) {
		return cd.cmtCount(exhibition_no);
	}
	public List<CommentDTO> cmtList(int exhibition_no) {
		return cd.cmtList(exhibition_no);
	}
	public int addComment(CommentDTO comment) {
		return cd.addComment(comment);
	}
	public int updateComment(CommentDTO comment) {
		return cd.updateComment(comment);
	}
	public int deleteComment(int comment_no) {
		return cd.deleteComment(comment_no);
	}
	public List<CommentDTO> lotsOfCmt(int i, int j) {
		return cd.lotsOfCmt(i, j);
	}
}