package com.finalproj.view.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService cs;
	
	@RequestMapping("joinFormC")
	public String joinFormC() {
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
			session.setAttribute("c_id", customer.getC_id());
		}
		model.addAttribute("result", result);
		return "/customer/loginC";
	}
	@RequestMapping("viewInfoC")
	public String viewInfoC(Model model, HttpSession session) {
		String c_id = (String)session.getAttribute("c_id");
		CustomerDTO customerdto = cs.select(c_id);
		model.addAttribute("customerdto", customerdto);
		return "/customer/viewInfoC";
	}
	@RequestMapping("updateFormC")
	public String updateFormC(Model model, HttpSession session) {
		String c_id = (String)session.getAttribute("c_id");
		CustomerDTO customerdto = cs.select(c_id);
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
}
