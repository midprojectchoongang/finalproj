package com.finalproj.view.comment;
import java.util.List;
public interface CommentService {
	int cmtCount(int i);
	List<CommentDTO> cmtList(int exhibition_no);
}