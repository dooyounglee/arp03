package com.kh.arp.manager.model.service;

import java.util.List;

import com.kh.arp.manager.model.vo.Survey;

public interface SurveyService {


	int insertsurvey(Survey s);
	
	List<Survey> selectsurvey();
	
}
