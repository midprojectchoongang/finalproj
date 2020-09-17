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

	@RequestMapping("main")
	public String main(HttpSession session, Model model) throws ParseException {
		String keyword = null;
		if (session.getAttribute("c_id") != null) {
			String c_id = (String)session.getAttribute("c_id");
			CustomerDTO customer = cs.select(c_id);
			keyword = customer.getC_hashtag();
		}
		
		Collection<ExhibitionDTO> list = new ArrayList<ExhibitionDTO>();
		
		if (keyword == null) {
			list = es.list(0, 5, keyword);
		} else {
			JSONParser jp = new JSONParser();
			JSONObject jo;
			jo = (JSONObject)jp.parse(keyword);
			JSONArray ja = (JSONArray)jo.get("hash");
			String c = ja + "";
			Gson gson = new Gson();
			String[] tags = gson.fromJson(c, String[].class);
			list = es.compList(0, 5, tags);
		}
		
		model.addAttribute("exList", list);
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
	@RequestMapping("map")
	public String map() {
		return "/account/map";
	}
	@RequestMapping("writeForm")
	public String about() {
		return "/mainPage/writeForm";
	}
	@RequestMapping("hash")
	public String hash(Model model) {
		List<HashtagDTO> hashList = hs.hashList();
		model.addAttribute("hashList", hashList);
		return "/mainPage/hash";
	}
	@RequestMapping("list")
	public String list() {
		return "/mainPage/list";
	}
}