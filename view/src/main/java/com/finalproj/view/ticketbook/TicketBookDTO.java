package com.finalproj.view.ticketbook;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TicketBookDTO {

	private int ticketbook_no;
	private String c_id;
	private String title;
	private String content;
	private String filename;
	private Date visit_date;
	private Date reg_date;
	private String del;
	
	// img
	private MultipartFile file;
	
	// paging
	private int startRow;
	private int endRow;
}
