package com.finalproj.view.hashtag;
import java.util.List;
public interface HashtagDAO {
	List<HashtagDTO> hashList(HashtagDTO hashtag);
	int hashChk(String hash_title);
}