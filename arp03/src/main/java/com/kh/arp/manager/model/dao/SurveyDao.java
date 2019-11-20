package com.kh.arp.manager.model.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.member.model.vo.Member;

@Repository
public class SurveyDao {

	@Autowired
	private SqlSession sqlSession;
	public int insertsurvey() {
		
		return sqlSession.insert("managerMapper.insertSurvey");
	}

}
