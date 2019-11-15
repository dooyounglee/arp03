package com.kh.arp.qna.model.service;

import java.util.List;

import com.kh.arp.qna.model.vo.Qna;

public interface QnaService {

	List<Qna> getMyQnaList(int m_no);

	Qna getQna(int qna_no);

	int writeQna(Qna qna);

	int delQna(Qna qna);

	int answerQna(Qna newqna);

}
