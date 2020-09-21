package com.finalproj.view.comment;
import java.util.Collection;
import java.util.List;
public interface CommentService {
	int cmtCount(int i);
	List<CommentDTO> cmtList(int exhibition_no);
	int addComment(CommentDTO comment);
	int updateComment(CommentDTO comment);
	int deleteComment(int comment_no);
	List<CommentDTO> lotsOfCmt(int i, int j);
}