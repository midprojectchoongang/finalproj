package com.finalproj.view.ticketbook;

import java.io.File;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.GregorianCalendar;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class TicketBookController {
	
	@Autowired
	private TicketBookService tbs;
	
	@RequestMapping("/cus/ticketList")
	public String ticketList(String date, TicketBookDTO tbook, HttpSession session, Model model) {
		String c_id = (String) session.getAttribute("c_id");

		tbook.setC_id(c_id);
		tbook.setDate(date);
		Collection<TicketBookDTO> list = tbs.list(tbook);
		
		model.addAttribute("date", date);
		model.addAttribute("list", list);
		return "ticketbook/ticketList";
	}
	
	@SuppressWarnings("static-access")
	@RequestMapping("/cus/ticketCal")
	public String ticketCal(HttpSession session, String date, Model model) {
		String c_id = (String) session.getAttribute("c_id");
		
		String year = "";
		String month =  "";
		if (date == null || date.equals("")) {
			GregorianCalendar today = new GregorianCalendar();
			year = today.get(today.YEAR) + "";
			if (today.get(today.MONTH) < 10) {
				month = "0" + (today.get(today.MONTH) + 1) + "";
			} else {
				month = (today.get(today.MONTH) + 1) + "";
			}
			date = year + month;
		}
		model.addAttribute("date", date);
		model.addAttribute("c_id", c_id);
		return "ticketbook/ticketCal";
	}

	
	@RequestMapping("/cus/ticketView")
	public String ticketView(int ticketbook_no, String pageNum, String date, Model model) {
		TicketBookDTO ticket = tbs.view(ticketbook_no);
		model.addAttribute("ticket", ticket);
		model.addAttribute("date", date);
		model.addAttribute("pageNum", pageNum);
		return "ticketbook/ticketView";
	}
	
	@RequestMapping("/cus/ticketWriteForm")
	public String ticketWriteForm(HttpSession session, Model model) {
		String c_id = (String) session.getAttribute("c_id");
		model.addAttribute("c_id", c_id);
		return "ticketbook/ticketWriteForm";
	}
	
	@RequestMapping("ticketWrite")
	public String ticketWrite(TicketBookDTO ticket, Model model, HttpSession session) throws Exception {
		int result = 0;
		String realPath = session.getServletContext().getRealPath("/ticketImg");
		MultipartFile poster = ticket.getFile();
		String fileName = UUID.randomUUID().toString().replace("-", "") + "_" + poster.getOriginalFilename();
		try {
			poster.transferTo(new File(realPath + File.separator + fileName));
		} catch (Exception e) {
			System.out.println("업로드 오류");
		}
		ticket.setFilename(fileName);
		DateFormat sdFormat = new SimpleDateFormat("yyyyMM");
		String date = sdFormat.format(ticket.getVisit_date());

		result = tbs.insert(ticket);
		model.addAttribute("date", date);
		model.addAttribute("result", result);
		return "ticketbook/ticketCal";
	}
	
	@RequestMapping("/cus/ticketUpdateForm")
	public String ticketUpdateForm(String ticketbook_no, String date, Model model) {
		int tno = Integer.parseInt(ticketbook_no);
		TicketBookDTO ticket = tbs.view(tno);
		model.addAttribute("date", date);
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
		result = tbs.update(ticket);
		
		model.addAttribute("ticketbook_no", ticket.getTicketbook_no());
		model.addAttribute("result", result);
		return "ticketbook/ticketUpdate";
	}
	
	@RequestMapping("/cus/ticketDel")
	public String ticketDel(TicketBookDTO ticket, Model model) {
		int result = tbs.delete(ticket);
		model.addAttribute("ticket", ticket);
		model.addAttribute("result", result);
		return "ticketbook/ticketDel";
	}
}
