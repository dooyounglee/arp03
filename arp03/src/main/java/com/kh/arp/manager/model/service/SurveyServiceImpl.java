package com.kh.arp.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.manager.model.dao.SurveyDao;
import com.kh.arp.manager.model.vo.InsertSurvey;
import com.kh.arp.manager.model.vo.SelectSurveyStudent;
import com.kh.arp.manager.model.vo.SurveyQuestion;

@Service("ss")
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	private SurveyDao sDao;
	
	/**
	 * 설문 양식을 넣는 서비스
	 */
	@Override
	public int insertsurvey(InsertSurvey s) {
		return sDao.insertsurvey(s);
	}

	/**
	 * 수업에 있는 설문을 조회해오는 서비스
	 */
	@Override
	public List<InsertSurvey> selectsurvey(int lec_no) {
		return sDao.selectsurvey(lec_no);
	}
	
	/**
	 * 학생이 보는 설문조사 조회용을 불러오는것
	 */
	@Override
	public List<SurveyQuestion> selectsurveystudent(SelectSurveyStudent sss) {
		return sDao.selectsurveystudent(sss);
	}
	
	/**
	 * 설문조사 상세 보기 답을 하는 설문조사로 들어감
	 */
	@Override
	public List<SurveyQuestion> detailsurvey(SurveyQuestion sq) {
		return sDao.detailsurvey(sq);
	}

	/**
	 *
	 */
	@Override
	public int insertcompletesurvey(SurveyQuestion s) {
		return sDao.insertcompletesurvey(s);
	}

	@Override
	public int insertsurveyquestion(SurveyQuestion s) {
		return sDao.insertsurveyquestion(s);
	}


	@Override
	public List<SurveyQuestion> selectstudentmember(int lec_no) {
		return sDao.selectstudentmember(lec_no);
	}

	@Override
	public int selectsu_no() {
		return sDao.selectsu_no();
	}

	@Override
	public int updatesurveyquestion(SurveyQuestion s) {
		return sDao.updatesurveyquestion(s);
	}

	@Override
	public List<SurveyQuestion> detailsurveyYstudent(int su_no) {
		return sDao.detailsurveyYstudent(su_no);
	}

	@Override
	public List<SurveyQuestion> detailsurveyNstudent(int su_no) {
		return sDao.detailsurveyNstudent(su_no);
	}

	@Override
	public List<SurveyQuestion> resultsurvey(SurveyQuestion sq) {
		return sDao.resultsurvey(sq);
	}

	@Override
	public List<SurveyQuestion> sq_nosurvey(SurveyQuestion sq) {
		return sDao.sq_nosurvey(sq);
	}

	@Override
	public float sumsurvey(SurveyQuestion sq) {
		return sDao.sumsurvey(sq);
	}

	@Override
	public List<SurveyQuestion> selectstudent(SurveyQuestion sq) {
		return sDao.selectstudent(sq);
	}

	
}
