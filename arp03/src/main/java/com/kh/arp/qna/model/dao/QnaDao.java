package com.kh.arp.qna.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.qna.model.vo.Qna;

@Repository
public class QnaDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Qna> getMyQnaList(int m_no) {
		return sqlSession.selectList("qnaMapper.getMyQnaList",m_no);
	}

	public Qna getQna(int qna_no) {
		return sqlSession.selectOne("qnaMapper.getQna",qna_no);
	}

	public int writeQna(Qna qna) {
		sqlSession.insert("qnaMapper.writeQna",qna);
		return qna.getQna_no();
	}

	public int delQna(Qna qna) {
		return sqlSession.update("qnaMapper.delQna",qna);
	}

	public int answerQna(Qna newqna) {
		return sqlSession.update("qnaMapper.answerQna",newqna);
	}

}
