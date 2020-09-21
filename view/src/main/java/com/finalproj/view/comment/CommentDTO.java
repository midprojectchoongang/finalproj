package com.finalproj.view.comment;
import java.sql.Date;
import lombok.Data;
@Data
public class CommentDTO {
	private int comment_no, exhibition_no;
	private String c_id, content, del;
	private Date reg_date;
	// nickname용
	private String nickname;
	// listByCmt용
	private int cnt;
}