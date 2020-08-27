package com.finalproj.view.comment;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.finalproj.view.customer.CustomerService;
@Controller
public class CommentController {
	@Autowired
	private CommentService cmt;
	@Autowired
	private CustomerService cs;
	
	@RequestMapping("commentList")
	public String commentList(int exhibition_no, Model model) {
		int count = cmt.cmtCount(exhibition_no);
		List<CommentDTO> cmtList = cmt.cmtList(exhibition_no);
		/* Map<String, String> nickname = new HashMap<String, String>(); */
		for (CommentDTO cus : cmtList) {
			String c_id = cus.getC_id();
			System.out.println(c_id);
			System.out.println(cs.selectNick(c_id));
			/* nickname.put(cus.getC_id(), cs.selectNick(cus.getC_id())); */
		}
		model.addAttribute("count", count);
		model.addAttribute("cmtList", cmtList);
		return "/comment/commentList";
	}
}