package com.kh.arp.manager.model.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.manager.model.dao.SurveyDao;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	private SurveyDao sd;
	@Override
	public int insertsurvey(int lec_no, HttpSession session) {
		int result=sd.insertsurvey(lec_no, session);
		return result;
	}
	@Override
	public Lecture getLecture(int lec_no) {
		Lecture lec=sd.getLecture(lec_no);
		return lec;
	}

}
