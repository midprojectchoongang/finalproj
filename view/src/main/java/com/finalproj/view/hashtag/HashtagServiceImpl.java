package com.finalproj.view.hashtag;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class HashtagServiceImpl implements HashtagService{
	@Autowired
	HashtagDAO hd;

	public List<HashtagDTO> list(HashtagDTO hashtag) {
		return hd.list(hashtag);
	}
}