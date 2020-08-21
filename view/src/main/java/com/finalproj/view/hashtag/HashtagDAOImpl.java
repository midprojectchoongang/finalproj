package com.finalproj.view.hashtag;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class HashtagDAOImpl implements HashtagDAO {
	@Autowired
	SqlSessionTemplate sst;

	public List<HashtagDTO> list(HashtagDTO hashtag) {
		return sst.selectList("hashtagns.list", hashtag);
	}
}