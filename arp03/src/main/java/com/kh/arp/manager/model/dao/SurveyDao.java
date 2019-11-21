package com.kh.arp.manager.model.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

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
		return sqlSession.selectList("managerMapper.selectSurvey");
	}
	public Survey detailsurvey(int su_no){
		return sqlSession.selectOne("managerMapper.detailSurvey", su_no);
	}
	
	public int updatesurvey(Survey s) {
		System.out.println(sqlSession.update("managerMapper.updateSurvey", s));
		return sqlSession.update("managerMapper.updateSurvey", s);
	}
}
