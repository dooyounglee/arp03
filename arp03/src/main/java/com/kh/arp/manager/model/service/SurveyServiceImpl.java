package com.kh.arp.manager.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.manager.model.dao.SurveyDao;
import com.kh.arp.manager.model.vo.Survey;
import com.kh.arp.member.model.vo.Member;

@Service("ss")
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	private SurveyDao sDao;
	
	@Override
	public int insertsurvey(Survey s) {
		return sDao.insertsurvey(s);
	}

	@Override
	public List<Survey> selectsurvey() {
		System.out.println("cqwr"+sDao.selectsurvey());
		return sDao.selectsurvey();
	}
}
