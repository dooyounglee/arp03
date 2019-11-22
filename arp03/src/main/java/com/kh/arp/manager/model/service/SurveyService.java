package com.kh.arp.manager.model.service;

import java.util.List;

import com.kh.arp.manager.model.vo.InsertSurvey;

public interface SurveyService {


	int insertsurvey(InsertSurvey s);
	
	List<InsertSurvey> selectsurvey();
	
	InsertSurvey detailsurvey(int su_no);
	
	int updatesurvey(InsertSurvey s);
	
}
