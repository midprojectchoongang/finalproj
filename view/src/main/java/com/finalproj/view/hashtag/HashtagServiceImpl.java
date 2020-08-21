package com.finalproj.view.hashtag;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class HashtagServiceImpl implements HashtagService{
	@Autowired
	private HashtagDAO hd;

	public List<HashtagDTO> hashList(HashtagDTO hashtag) {
		return hd.hashList(hashtag);
	}
}