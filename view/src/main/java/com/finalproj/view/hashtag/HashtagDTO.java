package com.finalproj.view.hashtag;
import lombok.Data;
@Data
public class HashtagDTO {
	private String hash_title, kind;
	private int hashgroup, use_count;
	// update용
	private String cur_title;
}