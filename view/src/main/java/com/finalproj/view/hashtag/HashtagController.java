package com.finalproj.view.hashtag;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class HashtagController {
	@Autowired
	private HashtagService hs;
	
	@RequestMapping("/master/viewHashList")
	public String viewHashList(Model model) {
		List<HashtagDTO> hashList = hs.hashList();
		model.addAttribute("hashList", hashList);
		return "/master/viewHashList";
	}
	
	@RequestMapping("/master/addHashForm")
	public String addHashForm() {
		return "/master/addHashForm";
	}
	@RequestMapping(value="hashChk", produces="text/html;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String hashChk(String hash_title, Model model) {
	    int result = hs.hashChk(hash_title); // 리턴값이 0이면 table에 없다는 뜻이므로 입력 가능
	    return String.valueOf(result);
	}
	@RequestMapping("/master/addHash")
	public String addHash(String hash_title, int hashgroup, Model model) {
		int result = 0;
		Map<String, String> map = new HashMap<String, String>();
		map.put("hash_title", hash_title);
		map.put("hashgroup", hashgroup + "");
		hs.addHash(map);
		result = hs.hashChk(hash_title); // 입력 후 값이 있으면 1, 없으면 0
		model.addAttribute("result", result);
		return "/master/addHash";
	}
	
	@RequestMapping("/master/hashDetail")
	public String hashDetail(String hash_title, Model model) {
		HashtagDTO hashtag = hs.select(hash_title);
		model.addAttribute("hashtag", hashtag);
		return "/master/hashDetail";
	}
	
	@RequestMapping("/master/updateHash")
	public String updateHash(String hash_title, String cur_title, int hashgroup, String kind, Model model) {
		int result = 0;
		if (kind.equals("custom")) {
			hashgroup = 0;
		}
		HashtagDTO hashtag = new HashtagDTO();
		hashtag.setHash_title(hash_title);
		hashtag.setCur_title(cur_title);
		hashtag.setHashgroup(hashgroup);
		hashtag.setKind(kind);
		hs.updateHash(hashtag);
		result = hs.hashChk(hash_title); // 변경 후 값이 있으면 1, 없으면 0
		model.addAttribute("result", result);
		return "/master/updateHash";
	}
	
	@RequestMapping("/master/deleteHash")
	public String deleteHash(String hash_title, Model model) {
		int result = 1;
		hs.deleteHash(hash_title);
		result = hs.hashChk(hash_title); // 삭제 후 값이 있으면 1, 없으면 0;
		model.addAttribute("result", result);
		return "/master/deleteHash";
	}
	
	@RequestMapping("hashSearch")
	public String hashSearch(Model model) {
		List<HashtagDTO> hashList = hs.hashList();
		model.addAttribute("hashList", hashList);
		return "/mainPage/hashSearch";
	}
	
	@RequestMapping(value="/biz/addHashChk", produces="text/html;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String idChk(String hashName, HttpSession session) {
	    int result = hs.hashChk(hashName);
	    if (result == 0) { // 값이 없으면 커스텀 해쉬태그 생성
	    	String b_id = (String) session.getAttribute("b_id");
	    	hs.addCustomHash(hashName, b_id);
	    }
	    return String.valueOf(result);
	}
	
	
	
	
	
	
}