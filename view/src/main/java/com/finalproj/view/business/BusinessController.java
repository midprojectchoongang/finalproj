package com.finalproj.view.business;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalproj.view.common.PagingBean;

@Controller
public class BusinessController {
	
	@Autowired
	private BusinessService bs;
	
	@RequestMapping("bizList")
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
	
	@RequestMapping("bizView")
	public String bizView(String b_id, String pageNum, Model model) {
		BusinessDTO biz = bs.select(b_id);
		String[] groupkind = {"개인사업자", "법인사업자", "기타"};
		model.addAttribute("groupkind", groupkind);
		model.addAttribute("pageNum", pageNum);
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
}
