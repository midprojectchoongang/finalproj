package com.finalproj.view.comment;
import java.util.List;
public interface CommentDAO {
	int cmtCount(int exhibition_no);
	List<CommentDTO> cmtList(int exhibition_no);
	int addComment(CommentDTO comment);
}