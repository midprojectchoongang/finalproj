package com.finalproj.view.customer;

import java.sql.Date;

import lombok.Data;

@Data
public class InterestDTO {
	
	public int interest_no;
	public int exhibition_no;
	public String c_id;
	public Date reg_date;
	
	//join
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
	private Date reg_date2;
	private String del;	
	private String filename;
}
