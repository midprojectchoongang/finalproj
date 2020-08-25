package com.finalproj.view.ticketbook;

import java.io.File;
import java.util.Collection;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.finalproj.view.common.PagingBean;


@Controller
public class TicketBookController {
	
	@Autowired
	private TicketBookService tbs;
	
	@RequestMapping("ticketList")
	public String ticketList(String pageNum, TicketBookDTO tbook, Model model) {
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		tbook.setC_id("test");
		int total = tbs.getTotal(tbook.getC_id());
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		tbook.setStartRow(startRow);
		tbook.setEndRow(endRow);
		Collection<TicketBookDTO> list = tbs.list(tbook);
		PagingBean page = new PagingBean(currentPage, rowPerPage, total);
		
		model.addAttribute("tbook", tbook);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("pageNum", pageNum);
		return "ticketbook/ticketList";
	}
	
	@RequestMapping("ticketView")
	public String ticketView(int ticketbook_no, String pageNum, Model model) {
		TicketBookDTO ticket = tbs.view(ticketbook_no);
		model.addAttribute("ticket", ticket);
		model.addAttribute("pageNum", pageNum);
		return "ticketbook/ticketView";
	}
	
	@RequestMapping("ticketWriteForm")
	public String ticketWriteForm(Model model) {
		// customer정보 내보내기
		return "ticketbook/ticketWriteForm";
	}
	
	@RequestMapping("ticketWrite")
	public String ticketWrite(TicketBookDTO ticket, Model model, HttpSession session) throws Exception {
		int result = 0;
		String realPath = session.getServletContext().getRealPath("/ticketImg");
		System.out.println(realPath);
		MultipartFile poster = ticket.getFile();
		String fileName = UUID.randomUUID().toString().replace("-", "") + "_" + poster.getOriginalFilename();
		try {
			poster.transferTo(new File(realPath + File.separator + fileName));
		} catch (Exception e) {
			System.out.println("업로드 오류");
		}
		ticket.setFilename(fileName);
		result = tbs.insert(ticket);
		
		model.addAttribute("result", result);
		return "ticketbook/ticketWrite";
	}
}