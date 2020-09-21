package com.finalproj.view.business;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.finalproj.view.common.PagingBean;
import com.finalproj.view.hashtag.HashtagDTO;
import com.finalproj.view.hashtag.HashtagService;
@Controller
public class BusinessController {
	@Autowired
	private BusinessService bs;
	@Autowired
	private HashtagService hs;
	
	// master 시작
	@RequestMapping("/master/bizList")
	public String bizList(String pageNum, BusinessDTO biz, Model model) {
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int total = bs.getTotal();
		int startRow = (currentPage - 1) * rowPerPage;
		int endRow = startRow + rowPerPage;
		biz.setStartRow(startRow);
		biz.setEndRow(endRow);
		Collection<BusinessDTO> list = bs.list(biz);
		PagingBean page = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("pageNum", pageNum);
		return "master/bizList";
	}
	
	@RequestMapping("/master/bizAdmin")
	public String bizAdmin(String b_id, String pageNum, Model model) {
		BusinessDTO biz = bs.select(b_id);
		String[] groupkind = {"개인사업자", "법인사업자", "기타"};	
		String[] db = {"c", "y", "n"};
		String[] text = {"승인 대기", "승인 완료", "승인 불가"};
		String[] comment = {
			"단체명/대표자 불일치",
			"등록번호 불일치",
			"대표번호 불일치",
			"메일주소 불일치",
			"홈페이지 불일치"
		};
		int[] com_no = {0, 1, 2, 3, 4};
		model.addAttribute("com_no", com_no);
		model.addAttribute("comment", comment);
		model.addAttribute("text", text);
		model.addAttribute("db", db);
		model.addAttribute("groupkind", groupkind);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("biz", biz);
		return "master/bizDetail";
	}
	
	@RequestMapping(value = "/master/bizConfirm", produces = "text/html;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String bizConfirm(String b_id, String confirm, String con_comment, Model model) {
		BusinessDTO biz = bs.select(b_id);
		biz.setConfirm(confirm);
		biz.setCon_comment(con_comment);
		int result = bs.joinConfirm(biz);
		return String.valueOf(result);
	}
	// master 끝
	
	@RequestMapping("/biz/bizView")
	public String bizView(HttpSession session, Model model) {
		String b_id = (String)session.getAttribute("b_id");
		BusinessDTO biz = bs.select(b_id);
		String[] groupkind = {"개인사업자", "법인사업자", "기타"};		
		String[] comment = {
				"단체명/대표자 불일치",
				"등록번호 불일치",
				"대표번호 불일치",
				"메일주소 불일치",
				"홈페이지 불일치"
		};
		model.addAttribute("comment", comment);
		model.addAttribute("groupkind", groupkind);
		model.addAttribute("biz", biz);
		return "business/bizView";
	}
	

	
	@RequestMapping("bizJoinForm")
	public String bizJoinForm(Model model) {
		String[] groupkind = {"개인사업자", "법인사업자", "기타"};
		String[] groupname = {"licensee", "corporation", "etc"};
		
		model.addAttribute("groupkind", groupkind);
		model.addAttribute("groupname", groupname);
		return "business/joinForm";
	}
	
	@RequestMapping(value="b_idChk", produces="text/html;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String idChk(String b_id) {
		int result = bs.idChk(b_id);
		return String.valueOf(result);
	}
	@RequestMapping("bizJoin")
	public String bizJoin(BusinessDTO biz, Model model) {
		int result = 0;
		BusinessDTO bsness = bs.select(biz.getB_id());
		if (bsness == null) {
			result = bs.insert(biz);
		} else {
			result = -1;
		}		
		model.addAttribute("result", result);
		return "business/join";
	}
	@RequestMapping("bizLoginForm")
	public String bizLoginForm() {
		return "business/bizLoginForm";
	}
	@RequestMapping("bizLogin")
	public String bizLogin(BusinessDTO biz, Model model, HttpSession session) {
		int result = 0;
		BusinessDTO bsness = bs.select(biz.getB_id());
		if (bsness == null || bsness.getDel().equals("y")) {
			result = -1;
		} else if (bsness.getB_password().equals(biz.getB_password())) {
			result = 1;
			session.setAttribute("login", "biz");
			session.setAttribute("b_id", bsness.getB_id());
		}
		model.addAttribute("result", result);
		return "business/bizLogin";
	}
	@RequestMapping("/biz/bizUpdateForm")
	public String bizUpdateForm(Model model, HttpSession session) {
		String b_id = (String)session.getAttribute("b_id");
		BusinessDTO bsness = bs.select(b_id);
		model.addAttribute("bsness", bsness);
		return "business/bizUpdateForm";
	}
	@RequestMapping("/biz/bizUpdate")
	public String bizUpdate(BusinessDTO biz, Model model) {
		int result = bs.update(biz);
		model.addAttribute("result", result);
		return "business/bizUpdate";
	}
	@RequestMapping("bizLogout")
	public String bizLogout(HttpSession session) {
		session.invalidate();
		return "business/logout";
	}
	@RequestMapping("/biz/bizDelete")
	public String bizDelete(Model model, HttpSession session) {
		String b_id = (String)session.getAttribute("b_id");
		int result = bs.delete(b_id);
		if (result > 0)
			session.invalidate();
		model.addAttribute("result", result);
		return "business/delete";
	}
	
	@RequestMapping("/biz/ownHash")
	public String ownHash(Model model, HttpSession session) {
		String b_id = (String)session.getAttribute("b_id");
		List<HashtagDTO> ownHash = hs.ownHash(b_id);
		model.addAttribute("ownHash", ownHash);
		return "business/ownHash";
	}
	@RequestMapping(value="deleteHash", produces="text/html;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String deleteHash(String hash_title) {
		hs.deleteHash(hash_title);
		int result = hs.hashChk(hash_title);
		return String.valueOf(result);
	}
}
