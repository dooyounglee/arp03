package com.kh.arp.manager.model.service;

import java.util.List;

import com.kh.arp.manager.model.vo.InsertSurvey;
import com.kh.arp.manager.model.vo.SelectSurveyStudent;
import com.kh.arp.manager.model.vo.SurveyQuestion;

public interface SurveyService {


	int insertsurvey(InsertSurvey s);
	
	List<InsertSurvey> selectsurvey(int lec_no);
	
	List<SurveyQuestion>selectsurveystudent(SelectSurveyStudent sss);
	
	List<SurveyQuestion> detailsurvey(SurveyQuestion sq);
	
	int selectsu_no();
	
	List<SurveyQuestion> selectstudentmember(int lec_no);
	
	int insertcompletesurvey(SurveyQuestion s);
	
	int insertsurveyquestion(SurveyQuestion s);
	
	int updatesurveyquestion(SurveyQuestion s);
	
	List<SurveyQuestion> detailsurveyYstudent(int su_no);
	
	List<SurveyQuestion> detailsurveyNstudent(int su_no);
	
	List<SurveyQuestion> resultsurvey(SurveyQuestion sq);
	
	List<SurveyQuestion> sq_nosurvey(SurveyQuestion sq);
	
	float sumsurvey(SurveyQuestion sq);
	
	List<SurveyQuestion> selectstudent(SurveyQuestion sq);
}
