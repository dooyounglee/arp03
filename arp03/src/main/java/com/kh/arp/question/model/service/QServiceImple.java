package com.kh.arp.question.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.common.PageInfo;
import com.kh.arp.member.model.vo.Lecture;
import com.kh.arp.question.model.dao.QDao;
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

	
}
