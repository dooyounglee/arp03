package com.kh.arp.manager.model.dao;

import java.util.ArrayList;
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
	
	public List<SurveyQuestion> detailsurvey(SurveyQuestion sq){
		return sqlSession.selectList("surveyMapper.detailSurvey", sq);
	}
	
	public int insertcompletesurvey(SurveyQuestion s) {
		return sqlSession.insert("surveyMapper.insertCompleteSurvey", s);
	}
	public int insertsurveyquestion(SurveyQuestion s) {
		return sqlSession.insert("surveyMapper.insertSurveyQuestion", s);
	}
	
	public List<SurveyQuestion> selectstudentmember(int lec_no){
		return sqlSession.selectList("surveyMapper.selectstudentmember", lec_no);
	}
	public int selectsu_no() {
		return sqlSession.selectOne("surveyMapper.selectsu_no");
	}
	public int updatesurveyquestion(SurveyQuestion sq) {
		return sqlSession.update("surveyMapper.updatesurveyquestion",sq);
	}
	public List<SurveyQuestion> detailsurveyYstudent(int su_no){
		return sqlSession.selectList("surveyMapper.detailSurveyYStudent", su_no);
	}
	public List<SurveyQuestion> detailsurveyNstudent(int su_no){
		return sqlSession.selectList("surveyMapper.detailSurveyNStudent", su_no);
	}
	public List<SurveyQuestion> sq_nosurvey(SurveyQuestion sq){
		return sqlSession.selectList("surveyMapper.sq_noSurvey", sq);
	}
	public List<SurveyQuestion> resultsurvey(SurveyQuestion sq){
		return sqlSession.selectList("surveyMapper.resultSurvey", sq);
	}
	public float sumsurvey(SurveyQuestion sq){
		System.out.println("sq"+sq);
		return sqlSession.selectOne("surveyMapper.sumsurvey", sq);
	}
	public List<SurveyQuestion> selectstudent(SurveyQuestion sq){
		return sqlSession.selectList("surveyMapper.selectstudent", sq);
	}
}
