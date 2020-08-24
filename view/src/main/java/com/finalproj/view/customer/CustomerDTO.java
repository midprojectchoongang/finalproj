package com.finalproj.view.customer;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class CustomerDTO {
	@NotBlank
	private String c_id;
	@NotBlank
	private String c_password;
	@NotBlank
	private String nickname;
	@NotBlank
	@Email
	@Pattern(regexp = ".+@.+")
	private String email;
	private String c_hashtag;
	private String c_role;
	private Date reg_date;
	private String del;
}
