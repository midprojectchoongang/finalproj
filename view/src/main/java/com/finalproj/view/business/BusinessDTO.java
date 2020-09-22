package com.finalproj.view.business;

import java.sql.Date;

import lombok.Data;

@Data
public class BusinessDTO {

	public String b_id;
	public String b_password;
	public String groupName;
	public String ceoName;
	public String tel;
	public String email;
	public String groupkind;	//individual, corporation, etc
	public String licensee;
	public String corporation;
	public String etc;
	public String website;
	public String confirm;
	public String con_comment;
	public Date confirm_date;
	public Date reg_date;
	public String del;
	
	
	// paging
	private int startRow;
	private int endRow;
	
}
