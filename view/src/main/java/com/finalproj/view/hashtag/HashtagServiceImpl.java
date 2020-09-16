package com.finalproj.view.hashtag;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class HashtagServiceImpl implements HashtagService{
	@Autowired
	private HashtagDAO hd;

	public List<HashtagDTO> hashList() {
		return hd.hashList();
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
	public void addCustomHash(String hashName, String b_id) {
		hd.addCustomHash(hashName, b_id);
	}
	public List<HashtagDTO> ownHash(String b_id) {
		return hd.ownHash(b_id);
	}
	public void usedHash(String hashName) {
		hd.usedHash(hashName);
	}
}