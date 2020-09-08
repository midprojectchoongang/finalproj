package com.finalproj.view.ticketbook;

import java.awt.List;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.finalproj.view.common.PagingBean;


@Controller
public class TicketBookController {
	
	@Autowired
	private TicketBookService tbs;
	
	@RequestMapping("ticketList")
	public String ticketList(String date, TicketBookDTO tbook, HttpSession session, Model model) {
		String c_id = (String) session.getAttribute("c_id");
		tbook.setC_id(c_id);
		tbook.setDate(date);
		Collection<TicketBookDTO> list = tbs.list(tbook);
		
		model.addAttribute("list", list);
		return "ticketbook/ticketList";
	}
	
	@RequestMapping("ticketCal")
	public String ticketCal(HttpSession session, String date, Model model) {
		String c_id = (String) session.getAttribute("c_id");
		model.addAttribute("c_id", c_id);
		return "ticketbook/ticketCal";
	}

	
	@RequestMapping("ticketView")
	public String ticketView(int ticketbook_no, String pageNum, Model model) {
		TicketBookDTO ticket = tbs.view(ticketbook_no);
		model.addAttribute("ticket", ticket);
		model.addAttribute("pageNum", pageNum);
		return "ticketbook/ticketView";
	}
	
	@RequestMapping("ticketWriteForm")
	public String ticketWriteForm(HttpSession session, Model model) {
		String c_id = (String) session.getAttribute("c_id");
		model.addAttribute("c_id", c_id);
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
			//poster.transferTo(new File(realPath + fileName));
			poster.transferTo(new File(realPath + File.separator + fileName));
		} catch (Exception e) {
			System.out.println("업로드 오류");
		}
		ticket.setFilename(fileName);
		result = tbs.insert(ticket);
		
		model.addAttribute("result", result);
		return "ticketbook/ticketCal";
	}
	
	@RequestMapping("ticketUpdateForm")
	public String ticketUpdateForm(String ticketbook_no, Model model) {
		int tno = Integer.parseInt(ticketbook_no);
		TicketBookDTO ticket = tbs.view(tno);
		model.addAttribute("ticket", ticket);
		return "ticketbook/ticketUpdateForm";
	}
	
	@RequestMapping("ticketUpdate")
	public String ticketUpdate(TicketBookDTO ticket, Model model, HttpSession session) throws Exception {
		int result = 0;
		if (ticket.getFileChange().equals("y")) {
		String realPath = session.getServletContext().getRealPath("/ticketImg");
		MultipartFile poster = ticket.getFile();
		String fileName = UUID.randomUUID().toString().replace("-", "") + "_" + poster.getOriginalFilename();
		try {
			poster.transferTo(new File(realPath + File.separator + fileName));
		} catch (Exception e) {
			System.out.println("업로드 오류");
		}
		ticket.setFilename(fileName);
		} else {
			ticket.setFilename(ticket.getOldFilename());
		}
		System.out.println(ticket);
		result = tbs.update(ticket);
		
		model.addAttribute("ticketbook_no", ticket.getTicketbook_no());
		model.addAttribute("result", result);
		return "ticketbook/ticketUpdate";
	}
	
	@RequestMapping("ticketDel")
	public String ticketDel(TicketBookDTO ticket, Model model) {
		int result = tbs.delete(ticket);
		model.addAttribute("ticket", ticket);
		model.addAttribute("result", result);
		return "ticketbook/ticketDel";
	}
}
