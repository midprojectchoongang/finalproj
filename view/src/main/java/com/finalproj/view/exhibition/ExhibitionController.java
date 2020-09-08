package com.finalproj.view.exhibition;

import java.io.*;
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
public class ExhibitionController {
	@Autowired
	private ExhibitionService es;
	
	@RequestMapping("exList")
	public String exList(String pageNum, Model model) {
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 5;
		int total = es.getTotal();
		int startRow = (currentPage - 1) * rowPerPage;
		int endRow = startRow + rowPerPage;
		Collection<ExhibitionDTO> list = es.list(startRow, endRow);
		PagingBean page = new PagingBean(currentPage, rowPerPage, total);
//		model.addAttribute("startRow", startRow);
//		model.addAttribute("endRow", endRow);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
//		model.addAttribute("pageNum", pageNum);

		return "exhibition/exList";
	}
	@RequestMapping("exWriteForm")
	private String exWriteForm() {
		return "exhibition/exWriteForm";
	}
	@RequestMapping("exWrite")
	private String exWrite(ExhibitionDTO ex, Model model, HttpSession session) {
		int result = 0;
		String realPath = session.getServletContext().getRealPath("/exImg");
		MultipartFile poster = ex.getFile();
		String fileName = UUID.randomUUID().toString().replace("-", "") + "_" + poster.getOriginalFilename();
		try {
			poster.transferTo(new File(realPath + File.separator + fileName));
		} catch (Exception e) {
			System.out.println("업로드 오류");
		}
		ex.setFilename(fileName);		
		result = es.insert(ex);
		
		model.addAttribute("exhibition_no", ex.getExhibition_no());
		model.addAttribute("result", result);
		return "exhibition/exWrite";
	}
	@RequestMapping("exView")
	private String exView(int exhibition_no, String pageNum, Model model) {
		ExhibitionDTO ex = es.view(exhibition_no);
		model.addAttribute("ex", ex);
		model.addAttribute("pageNum", pageNum);
		return "exhibition/exView";
	}
	@RequestMapping("exUpdateForm")
	public String exUpdateForm(int exhibition_no, String pageNum, Model model) {
		ExhibitionDTO ex = es.select(exhibition_no);
		model.addAttribute("ex", ex);
		model.addAttribute("pageNum", pageNum);
		return "exhibition/exUpdateForm";
	}
	@RequestMapping("exUpdate")
	public String exUpdate(ExhibitionDTO ex, String pageNum, Model model, HttpSession session) {	
		String realPath = session.getServletContext().getRealPath("/exImg");
		MultipartFile poster = ex.getFile();
		String fileName = UUID.randomUUID().toString().replace("-", "") + "_" + poster.getOriginalFilename();
		try {
			poster.transferTo(new File(realPath + File.separator + fileName));
		} catch (Exception e) {
			System.out.println("업로드 오류");
		}
		ex.setFilename(fileName);		
		int result = es.update(ex);
		
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "exhibition/exUpdate";
	}
	@RequestMapping("exDelete")
	public String exDelete(int exhibition_no, String pageNum, Model model) {
		int result = es.delete(exhibition_no);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "exhibition/exDelete";
	}
	
	
}
