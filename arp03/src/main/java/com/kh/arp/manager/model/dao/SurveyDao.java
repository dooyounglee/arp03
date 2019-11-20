package com.kh.arp.manager.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.manager.model.vo.Survey;

@Repository("sDao")
public class SurveyDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertsurvey(Survey s) {
		return sqlSession.insert("managerMapper.insertSurvey",s);
	}

	public List<Survey> selectsurvey(){
		System.out.println("gfu"+sqlSession.selectList("managerMapper.selectSurvey"));
		return sqlSession.selectList("managerMapper.selectSurvey");
	}
}
