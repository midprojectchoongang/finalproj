package com.finalproj.view.hashtag;
import java.util.List;
public interface HashtagService {
	List<HashtagDTO> hashList(HashtagDTO hashtag);
	int hashChk(String hash_title);
}