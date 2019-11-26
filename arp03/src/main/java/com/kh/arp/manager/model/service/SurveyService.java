package com.kh.arp.manager.model.service;

import java.util.List;

import com.kh.arp.manager.model.vo.CompleteSurvey;
import com.kh.arp.manager.model.vo.InsertSurvey;
import com.kh.arp.manager.model.vo.SurveyQuestion;

public interface SurveyService {


	int insertsurvey(InsertSurvey s);
	
	List<InsertSurvey> selectsurvey();
	
	List<SurveyQuestion> detailsurvey(SurveyQuestion sq);
	
	int selectsu_no();
	
	List<SurveyQuestion> selectstudentmember(int lec_no);
	
	int insertcompletesurvey(SurveyQuestion s);
	
	int insertsurveyquestion(SurveyQuestion s);
	
	int updatesurveyquestion(SurveyQuestion s);
	
	List<SurveyQuestion> detailsurveystudent(int su_no);
}
