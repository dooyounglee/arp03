package com.kh.arp.question.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.common.PageInfo;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.question.model.dao.QDao;
import com.kh.arp.question.model.vo.QFile;
import com.kh.arp.question.model.vo.Question;

@Service("qService")
public class QServiceImple implements QService{

	@Autowired
	private QDao qDao;

	@Override
	public List<Lecture> getClassList() {
		return qDao.getClassList();
	}

	@Override
	public int getListCount(int lec_no) {
		return qDao.getListCount(lec_no);
	}

	@Override
	public ArrayList<Question> selectQuestionList(PageInfo pi, int lec_no) {
		return qDao.selectQuestionList(pi, lec_no);
	}

	@Override
	public Lecture getLecture(int lec_no) {
		return qDao.getLecture(lec_no);
	}

	@Override
	public int qInsert(Question q) {
		
		return qDao.qInsert(q);
	}
	
	@Override
	public int qFileInsert(QFile qf) {
		return qDao.qFileInsert(qf);
	}

	/*
	 * @Override public ArrayList<Question> selectQuestionList2(Question q) { return
	 * qDao.selectQuestionList2(q); }
	 */

	@Override
	public Question selectDetailQuestion(int q_no) {
		
		// 조회수 먼저 증가
		int result = qDao.updateCount(q_no);
		
		if(result > 0) { // 제대로 업데이트
			return qDao.selectDetailQuestion(q_no);
		}else {
			return null;
		}
	}

	@Override
	public int qUpdate(Question q) {
		return qDao.qUpdate(q);
	}

	@Override
	public int qDelete(int q_no) {
		return qDao.qDelete(q_no);
	}
	
}
