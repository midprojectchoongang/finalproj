package com.finalproj.view.exhibition;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class ExhibitionDTO {
	private int exhibition_no; 
	private String b_id; 
	private String title;
	private String artist;
	private String gallery;
	private String gallery_site;
	private String address;
	private String ticket_link1;
	private String ticket_link2;
	private String ticket_link3;
	private int price;
	private Date start_date;
	private Date end_date;
	private String hashtags;
	private String content;
	private int like_cnt;
	private Date reg_date;
	private String del;	
	private String filename;
	private int comment_cnt;
	
	// img
	private MultipartFile file;
	private String oldFilename;
	private String fileChange;
		
	// paging
	private int startRow;
	private int endRow;
	
	// address
	private String sub_address;
}
