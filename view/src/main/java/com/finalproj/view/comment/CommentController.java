package com.finalproj.view.comment;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.finalproj.view.customer.CustomerService;
@Controller
public class CommentController {
	@Autowired
	private CommentService cmt;
	@Autowired
	private CustomerService cs;
	
	@RequestMapping("commentList")
	public String commentList(String exhibition_no, Model model) {
		int exno = Integer.parseInt(exhibition_no);
		int count = cmt.cmtCount(exno);
		List<CommentDTO> cmtList = cmt.cmtList(exno);
		for (CommentDTO cus : cmtList) {
			cus.setNickname(cs.selectNick(cus.getC_id()));
		}
		model.addAttribute("count", count);
		model.addAttribute("cmtList", cmtList);
		return "/comment/commentList";
	}

	/*
	 * @RequestMapping("commentWrite") public String writeCommentForm(int
	 * exhibition_no, Model model) { model.addAttribute("exhibition_no",
	 * exhibition_no); return "/comment/commentWrite"; }
	 */
	@RequestMapping(value="addComment", produces="text/html;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String addComment(String content, int exhibition_no, HttpSession session, Model model) {
		String c_id = (String)session.getAttribute("c_id");
		CommentDTO comment = new CommentDTO();
		comment.setC_id(c_id);
		comment.setExhibition_no(exhibition_no);
		comment.setContent(content);
		int result = cmt.addComment(comment);
	    return String.valueOf(result);
	}
	@RequestMapping(value="updateComment", produces="text/html;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String updateComment(String content, int comment_no, Model model) {
		CommentDTO comment = new CommentDTO();
		comment.setComment_no(comment_no);		
		comment.setContent(content);		
		int result = cmt.updateComment(comment);
	    return String.valueOf(result);
	}
	@RequestMapping(value="deleteComment", produces="text/html;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String deleteComment(int comment_no, HttpSession session, Model model) {	
		int result = cmt.deleteComment(comment_no);
	    return String.valueOf(result);
	}
}