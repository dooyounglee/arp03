package com.kh.arp.FAQ.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.FAQ.model.vo.FAQ;

@Repository
public class FAQdao {
	
	@Autowired
	private SqlSession sqlSession;

	public int insertFAQ(FAQ f) {
		// TODO Auto-generated method stub
		return sqlSession.insert("faqMapper.insertFAQ" , f);
	}

	public ArrayList<FAQ> selectList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("faqMapper.selectFAQ");
	}

	public int deleteFAQ(int faq_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("faqMapper.deleteFAQ" , faq_no);
	}

	public int selectCategory(String category) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("faqMapper.selectCategory" , category);
	}

}
