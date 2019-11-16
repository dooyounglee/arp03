package com.kh.arp.qna.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.qna.model.dao.QnaDao;
import com.kh.arp.qna.model.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qd;
	
	@Override
	public List<Qna> getMyQnaList(int m_no) {
		return qd.getMyQnaList(m_no);
	}

	@Override
	public Qna getQna(int qna_no) {
		return qd.getQna(qna_no);
	}

	@Override
	public int writeQna(Qna qna) {
		return qd.writeQna(qna);
	}

	@Override
	public int delQna(Qna qna) {
		return qd.delQna(qna);
	}

	@Override
	public int answerQna(Qna newqna) {
		return qd.answerQna(newqna);
	}

}
