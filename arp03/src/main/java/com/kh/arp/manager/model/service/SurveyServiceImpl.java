package com.kh.arp.manager.model.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.manager.model.dao.SurveyDao;
import com.kh.arp.member.model.vo.Member;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	private SurveyDao sd;
	@Override
	public int insertsurvey() {
		int result=sd.insertsurvey();
		return result;
	}
}
