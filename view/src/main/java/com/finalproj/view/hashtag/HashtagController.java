package com.finalproj.view.hashtag;
import java.util.List;
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
	
	@RequestMapping("hashMenu")
	public String hashMenu(HashtagDTO hashtag, Model model) {
		List<HashtagDTO> hashList = hs.hashList(hashtag);
		model.addAttribute("hashList", hashList);
		return "/master/hashMenu";
	}
	
	@RequestMapping("addHashForm")
	public String addHashForm() {
		return "/master/addHashForm";
	}
	@RequestMapping(value="hashChk", produces="text/html;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String hashChk(String hash_title, Model model) {
	    int result = hs.hashChk(hash_title);
	    return String.valueOf(result);
	}
	@RequestMapping("addHash")
	public String addHash(String hash_title, int hashgroup, Model model) {
		model.addAttribute("hash_title", hash_title);
		model.addAttribute("hashgroup", hashgroup);
		return "/master/addHash";
	}
}