package com.finalproj.view.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService cs;
	
	@RequestMapping("joinForm")
	public String joinForm() {
		return "/customer/joinForm";
	}
	@RequestMapping("join")
	public String join(CustomerDTO customer, Model model, HttpSession session) {
		int result = 0;
		System.out.println(customer.getC_id());
		CustomerDTO customerdto = cs.select(customer.getC_id());
		if (customerdto == null)
			result = cs.insert(customer);
		else result = -1;
		model.addAttribute("result", result);
		return "/customer/join";
	}
	@RequestMapping(value="idChk",produces="text/html;charset=utf-8")
	@ResponseBody
	public String idChk(String c_id) {
		String msg = ""; 
		CustomerDTO customerdto = cs.select(c_id); 
		if (customerdto == null) 
			msg="OK"; 
		else msg="NO";
		return msg;
	}
	@RequestMapping("viewInfo")
	public String viewInfo(Model model, HttpSession session) {
		String c_id = (String)session.getAttribute("c_id");
		CustomerDTO customerdto = cs.select(c_id);
		List<CustomerDTO> list = cs.list(c_id);
		model.addAttribute("customerdto", customerdto);
		model.addAttribute("list", list);
		return "viewInfo";
	}
}
