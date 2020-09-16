package com.finalproj.view.customer;
import java.io.Console;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproj.view.common.PagingBean;
import com.finalproj.view.exhibition.ExhibitionDTO;
import com.finalproj.view.exhibition.ExhibitionService;
import com.finalproj.view.hashtag.HashtagDTO;
import com.finalproj.view.hashtag.HashtagService;
import com.google.gson.Gson;
@Controller
public class CustomerController {
	@Autowired
	private CustomerService cs;
	@Autowired
	private HashtagService hs;
	@Autowired
	private InterestService is;
	@Autowired
	private ExhibitionService es;
	
	@RequestMapping("joinFormC")
	public String joinFormC(Model model) {
		List<HashtagDTO> hashList = hs.hashList();
		model.addAttribute("hashList", hashList);
		return "/customer/joinFormC";
	}
	@RequestMapping("joinC")
	public String joinC(CustomerDTO customer, Model model) {
		int result = 0;
		CustomerDTO customerdto = cs.select(customer.getC_id());
		if (customerdto == null)
			result = cs.insert(customer);
		else result = -1;
		model.addAttribute("result", result);
		return "/customer/joinC";
	}
	@RequestMapping(value="idChk", produces="text/html;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String idChk(String c_id) {
	    int result = cs.idChk(c_id);
	    return String.valueOf(result);
	}
	@RequestMapping(value="nickChk", produces="text/html;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String nickChk(String nickname) {
	    int result = cs.nickChk(nickname);
	    return String.valueOf(result);
	}
	
	@RequestMapping("loginFormC")
	public String loginFormC() {
		return "/customer/loginFormC";
	}
	@RequestMapping("loginC")
	public String loginC(CustomerDTO customer, Model model, HttpSession session) {
		int result = 0;
		CustomerDTO customerdto = cs.select(customer.getC_id());
		if (customerdto == null || customerdto.getDel().equals("y")) {
			result = -1;
		} else if (customerdto.getC_password().equals(customer.getC_password())) {
			result = 1;
			if (customerdto.getC_role().equals("admin")) {
				session.setAttribute("login", "admin");
			} else {
				session.setAttribute("login", "customer");
				session.setAttribute("c_id", customerdto.getC_id());
			}
		}
		model.addAttribute("result", result);
		return "/customer/loginC";
	}
	
	@RequestMapping("viewInfoC")
	public String viewInfoC(Model model, HttpSession session) throws ParseException {
		String c_id = (String)session.getAttribute("c_id");
		CustomerDTO customerdto = cs.select(c_id);
		
		/* JSON파싱 */
        JSONParser jp = new JSONParser();
        JSONObject jo;
        jo = (JSONObject)jp.parse(customerdto.getC_hashtag());
        JSONArray ja = (JSONArray)jo.get("hash");
        String c = ja + "";
        Gson gson = new Gson();
        String[] tags = gson.fromJson(c, String[].class);
        List<HashtagDTO> selectedHash = new ArrayList<HashtagDTO>();
        for (int i = 0; i < tags.length; i++) {
        	HashtagDTO selected =  hs.select(tags[i]);
        	selectedHash.add(selected);
        }
        
		model.addAttribute("selectedHash", selectedHash);
		model.addAttribute("customerdto", customerdto);
		return "/customer/viewInfoC";
	}
	@RequestMapping("updateFormC")
	public String updateFormC(Model model, HttpSession session) throws ParseException {
		String c_id = (String)session.getAttribute("c_id");
		CustomerDTO customerdto = cs.select(c_id);
		List<HashtagDTO> hashList = hs.hashList();
		
		/* JSON파싱 */
        JSONParser jp = new JSONParser();
        JSONObject jo;
        jo = (JSONObject)jp.parse(customerdto.getC_hashtag());
        JSONArray ja = (JSONArray)jo.get("hash");
        String c = ja + "";
        Gson gson = new Gson();
        String[] c_tags = gson.fromJson(c, String[].class);
        List<String> selectedHash = new ArrayList<String>();
        for (int i = 0; i < c_tags.length; i++) {
        	selectedHash.add("\""+c_tags[i]+"\"");
        }
        
		model.addAttribute("selectedHash", selectedHash);
		model.addAttribute("hashList", hashList);
		model.addAttribute("customerdto", customerdto);
		return "/customer/updateFormC";
	}
	@RequestMapping("updateC")
	public String updateC(CustomerDTO customer, Model model) {
		int result = cs.update(customer);
		model.addAttribute("result", result);
		return "/customer/updateC";
	}
	@RequestMapping("logoutC")
	public String logoutC(HttpSession session) {
		session.invalidate();
		return "/customer/logoutC";
	}
	@RequestMapping("deleteC")
	public String deleteC(Model model, HttpSession session) {
		String c_id = (String)session.getAttribute("c_id");
		int result = cs.delete(c_id);
		if (result > 0)
			session.invalidate();
		model.addAttribute("result", result);
		return "/customer/deleteC";
	}
	
	@RequestMapping("/cus/myExList")
	public String myExList (String pageNum, Model model, HttpSession session) {
		String c_id = (String)session.getAttribute("c_id");
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 5;
		int total = is.getTotal(c_id);
		int startRow = (currentPage - 1) * rowPerPage;
		Collection<ExhibitionDTO> myList = new ArrayList<ExhibitionDTO>();
		if (total == 0) {
			myList = null;
		} else {
			myList = is.myList(startRow, c_id);
		}
		PagingBean page = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("page", page);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("myList", myList);
		return "/customer/myExList";
	}
	
	@RequestMapping("add_Interest")
	@ResponseBody
	public int add_Interest(String exhibition_no, HttpSession session) {
		String c_id = (String) session.getAttribute("c_id");
		int ex_no = Integer.parseInt(exhibition_no);
		int result = 0;
		if (c_id == null) {
			result = 0;
		} else {
			es.likeCntUp(ex_no);
			result = is.addInt(exhibition_no, c_id);
		}
		return result;
	}
	
	@RequestMapping("remove_Interest")
	@ResponseBody
	public int remove_Interest(String exhibition_no, HttpSession session) {
		String c_id = (String) session.getAttribute("c_id");
		int ex_no = Integer.parseInt(exhibition_no);
		int result = 0;
		if (c_id == null) {
			result = 0;
		} else {
			es.likeCntDown(ex_no);
			result = is.removeInt(exhibition_no, c_id);
		}
		return result;
	}
}
