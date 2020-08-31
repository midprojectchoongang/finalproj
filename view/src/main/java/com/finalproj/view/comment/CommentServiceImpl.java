package com.finalproj.view.comment;
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
}