package com.kh.arp.manager.model.service;

import javax.servlet.http.HttpSession;

import com.kh.arp.lecture.model.vo.Lecture;

public interface SurveyService {

	int insertsurvey(int lec_no, HttpSession session);
	
}
