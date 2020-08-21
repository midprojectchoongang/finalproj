package com.finalproj.view.main;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.finalproj.view.hashtag.HashtagDTO;
import com.finalproj.view.hashtag.HashtagService;
@Controller
public class MainController {
	@Autowired
	HashtagService hs;
	
	@RequestMapping("main")
	public String main(HashtagDTO hashtag, Model model) {
		List<HashtagDTO> list = hs.list(hashtag);
		model.addAttribute("hashtagList", list);
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
}