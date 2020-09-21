package com.finalproj.view.hashtag;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class HashtagDAOImpl implements HashtagDAO {
	@Autowired
	private SqlSessionTemplate sst;

	public List<HashtagDTO> hashList() {
		return sst.selectList("hashtagns.list");
	}
	public int hashChk(String hash_title) {
		return sst.selectOne("hashtagns.hashChk", hash_title);
	}
	public int addHash(Map<String, String> map) {
		return sst.insert("hashtagns.insert", map);
	}
	public HashtagDTO select(String hash_title) {
		return sst.selectOne("hashtagns.select", hash_title);
	}
	public void updateHash(HashtagDTO hashtag) {
		sst.update("hashtagns.update", hashtag);
	}
	public void deleteHash(String hash_title) {
		sst.delete("hashtagns.delete", hash_title);
	}
	public void addCustomHash(String hashName, String b_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("hashName", hashName);
		map.put("b_id", b_id);
		sst.insert("hashtagns.addCustomHash", map);
	}
	public List<HashtagDTO> ownHash(String b_id) {
		return sst.selectList("hashtagns.ownHash", b_id);
	}
	public void usedHash(String hashName) {
		sst.update("hashtagns.usedHash", hashName);
	}
	public List<HashtagDTO> popularHash(int i, int j) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("i", i);
		map.put("j", j);
		return sst.selectList("hashtagns.popularHash", map);
	}
}