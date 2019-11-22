package com.kh.arp.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.manager.model.dao.SurveyDao;
import com.kh.arp.manager.model.vo.InsertSurvey;

@Service("ss")
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	private SurveyDao sDao;
	
	@Override
	public int insertsurvey(InsertSurvey s) {
		return sDao.insertsurvey(s);
	}

	@Override
	public List<InsertSurvey> selectsurvey() {
		return sDao.selectsurvey();
	}

	@Override
	public InsertSurvey detailsurvey(int su_no) {
		return sDao.detailsurvey(su_no);
	}

	@Override
	public int updatesurvey(InsertSurvey s) {
		return sDao.updatesurvey(s);
	}
}
