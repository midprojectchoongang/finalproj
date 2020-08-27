package com.finalproj.view.hashtag;
import java.util.List;
import java.util.Map;
public interface HashtagService {
	List<HashtagDTO> hashList();
	int hashChk(String hash_title);
	int addHash(Map<String, String> map);
	HashtagDTO select(String hash_title);
	void updateHash(HashtagDTO hashtag);
	void deleteHash(String hash_title);
}