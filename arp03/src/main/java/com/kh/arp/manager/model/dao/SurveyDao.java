package com.kh.arp.manager.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.manager.model.vo.CompleteSurvey;
import com.kh.arp.manager.model.vo.InsertSurvey;
import com.kh.arp.manager.model.vo.SurveyQuestion;

@Repository("sDao")
public class SurveyDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertsurvey(InsertSurvey s) {
		return sqlSession.insert("surveyMapper.insertSurvey",s);
	}

	public List<InsertSurvey> selectsurvey(){
		return sqlSession.selectList("surveyMapper.selectSurvey");
	}
	public InsertSurvey detailsurvey(int su_no){
		return sqlSession.selectOne("surveyMapper.detailSurvey", su_no);
	}
	
	public int insertcompletesurvey(CompleteSurvey s) {
		return sqlSession.insert("surveyMapper.insertCompleteSurvey", s);
	}
	public int insertsurveyquestion(SurveyQuestion s) {
		return sqlSession.insert("surveyMapper.insertSurveyQuestion", s);
	}
}
