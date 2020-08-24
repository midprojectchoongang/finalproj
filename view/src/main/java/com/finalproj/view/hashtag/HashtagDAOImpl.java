package com.finalproj.view.hashtag;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class HashtagDAOImpl implements HashtagDAO {
	@Autowired
	private SqlSessionTemplate sst;

	public List<HashtagDTO> hashList(HashtagDTO hashtag) {
		return sst.selectList("hashtagns.list", hashtag);
	}
	public int hashChk(String hash_title) {
		return sst.selectOne("hashtagns.hashChk", hash_title);
	}
}