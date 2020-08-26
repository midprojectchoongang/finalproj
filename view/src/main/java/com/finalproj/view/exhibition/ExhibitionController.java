package com.finalproj.view.exhibition;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExhibitionController {
	@Autowired
	private ExhibitionService es;
	
	@RequestMapping("exList")
	public String exList() {
		return "exhibition/exList";
	}
}
