package com.kh.arp.manager.model.service;

import java.util.List;

import com.kh.arp.manager.model.vo.CompleteSurvey;
import com.kh.arp.manager.model.vo.InsertSurvey;
import com.kh.arp.manager.model.vo.SurveyQuestion;

public interface SurveyService {


	int insertsurvey(InsertSurvey s);
	
	List<InsertSurvey> selectsurvey();
	
	InsertSurvey detailsurvey(int su_no);
	
	int insertcompletesurvey(CompleteSurvey s);
	
	int insertsurveyquestion(SurveyQuestion s);
}
