package com.kh.arp.manager.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.manager.model.vo.InsertSurvey;

@Repository("sDao")
public class SurveyDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertsurvey(InsertSurvey s) {
		return sqlSession.insert("managerMapper.insertSurvey",s);
	}

	public List<InsertSurvey> selectsurvey(){
		return sqlSession.selectList("managerMapper.selectSurvey");
	}
	public InsertSurvey detailsurvey(int su_no){
		return sqlSession.selectOne("managerMapper.detailSurvey", su_no);
	}
	
	public int updatesurvey(InsertSurvey s) {
		System.out.println(sqlSession.update("managerMapper.updateSurvey", s));
		return sqlSession.update("managerMapper.updateSurvey", s);
	}
}
