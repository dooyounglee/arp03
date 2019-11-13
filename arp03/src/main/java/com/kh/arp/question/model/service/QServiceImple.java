package com.kh.arp.question.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.common.PageInfo;
import com.kh.arp.question.model.dao.QDao;
import com.kh.arp.question.model.vo.Question;


@Service("qService")
public class QServiceImple implements QService{

	@Autowired
	private QDao qDao;


	@Override
	public int getListCount() {
		return qDao.getListCount();
	}

	@Override
	public ArrayList<Question> selectQuestionList(PageInfo pi) {
		return qDao.selectQuestionList(pi);
	}
	
}
