package com.finalproj.view.main;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.finalproj.view.comment.CommentDTO;
import com.finalproj.view.comment.CommentService;
import com.finalproj.view.customer.CustomerDTO;
import com.finalproj.view.customer.CustomerService;
import com.finalproj.view.exhibition.ExhibitionDTO;
import com.finalproj.view.exhibition.ExhibitionService;
import com.finalproj.view.hashtag.HashtagDTO;
import com.finalproj.view.hashtag.HashtagService;
import com.google.gson.Gson;
@Controller
public class MainController {
	@Autowired
	private HashtagService hs;
	@Autowired
	private CustomerService cs;
	@Autowired
	private ExhibitionService es;
	@Autowired
	private CommentService cmts;

	@RequestMapping("main")
	public String main(HttpSession session, Model model) throws ParseException {
		/* 슬라이드 */
		Collection<ExhibitionDTO> slideList = new ArrayList<ExhibitionDTO>();
		slideList = es.recentList(0, 10);
		
		/* 해쉬태그 기반 전시회 */
		Collection<ExhibitionDTO> rcmdList = new ArrayList<ExhibitionDTO>();
		CustomerDTO customer = new CustomerDTO();
		String c_id = (String)session.getAttribute("c_id");
		String hashList = "";
		if (c_id == null || c_id.equals("")) {
			List<HashtagDTO> popularHash = hs.popularHash(0, 3);
			String[] tags = new String[popularHash.size()];
			for (int i=0; i<popularHash.size(); i++) {
				tags[i] = popularHash.get(i).getHash_title().toString();
			}
			rcmdList = es.compList(0, 3, tags, "reg_date");
			hashList = "n";
		} else {
			customer = cs.select(c_id);
			JSONParser jp = new JSONParser();
			JSONObject jo;
			jo = (JSONObject)jp.parse(customer.getC_hashtag());
			JSONArray ja = (JSONArray)jo.get("hash");
			String c = ja + "";
			Gson gson = new Gson();
			String[] tags = gson.fromJson(c, String[].class);
			hashList = "y";
			rcmdList = es.compList(0, 3, tags, "reg_date");
      
			// 사용자 해시태그와 일치하는 전시가 등록되지 않은 경우
			if (rcmdList == null || rcmdList.size() == 0) {
				List<HashtagDTO> popularHash = hs.popularHash(0, 3);
				tags = new String[popularHash.size()];
				for (int i=0; i<popularHash.size(); i++) {
					tags[i] = popularHash.get(i).getHash_title().toString();
				}
				rcmdList = es.compList(0, 3, tags, "reg_date");
				hashList = "n";
			}
		}
		
		/* 댓글 기반 */
		Collection<ExhibitionDTO> cmtList = new ArrayList<ExhibitionDTO>();
		List<CommentDTO> lotsOfCmt = cmts.lotsOfCmt(0, 3);
		int[] exNos = new int[lotsOfCmt.size()];
		for (int i=0; i<lotsOfCmt.size(); i++) {
			exNos[i] = lotsOfCmt.get(i).getExhibition_no();
		}
		cmtList = es.listByCmt(exNos);
		
		model.addAttribute("slideList", slideList);
		model.addAttribute("hashList", hashList);
		model.addAttribute("rcmdList", rcmdList);
		model.addAttribute("cmtList", cmtList);
		return "/mainPage/main";
	}
	@RequestMapping("loginForm")
	public String loginForm() {
		return "/account/loginForm";
	}
	@RequestMapping("login")
	public String login() {
		return "/account/login";
	}
	@RequestMapping("hash")
	public String hash(Model model) {
		List<HashtagDTO> hashList = hs.hashList();
		model.addAttribute("hashList", hashList);
		return "/mainPage/hash";
	}
}