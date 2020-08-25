package com.finalproj.view.hashtag;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class HashtagServiceImpl implements HashtagService{
	@Autowired
	private HashtagDAO hd;

	public List<HashtagDTO> hashList(HashtagDTO hashtag) {
		return hd.hashList(hashtag);
	}
	public int hashChk(String hash_title) {
		return hd.hashChk(hash_title);
	}
	public int addHash(Map<String, String> map) {
		return hd.addHash(map);
	}
	public HashtagDTO select(String hash_title) {
		return hd.select(hash_title);
	}
	public void updateHash(HashtagDTO hashtag) {
		hd.updateHash(hashtag);
	}
	public void deleteHash(String hash_title) {
		hd.deleteHash(hash_title);
	}
}