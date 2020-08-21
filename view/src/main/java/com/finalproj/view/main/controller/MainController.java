package com.finalproj.view.main.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MainController {

	@RequestMapping("main")
	public String main() {
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
	public String hash() {
		return "/mainPage/hash";
	}
	@RequestMapping("list")
	public String list() {
		return "/mainPage/list";
	}
}