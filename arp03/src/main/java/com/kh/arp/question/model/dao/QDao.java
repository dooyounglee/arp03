package com.kh.arp.question.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.board.model.vo.Board;
import com.kh.arp.common.PageInfo;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.question.model.vo.QFile;
import com.kh.arp.question.model.vo.QReply;
import com.kh.arp.question.model.vo.Question;

@Repository("qDao")
public class QDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Lecture> getClassList() {
		return sqlSession.selectList("lectureMapper.getClassList",null);
	}
	
	public int getListCount(int lec_no) {
		return sqlSession.selectOne("questionMapper.getListCount", lec_no);
	}

	public ArrayList<Question> selectQuestionList(PageInfo pi, int lec_no) {
		
		//RowBounds rowBounds = new RowBounds(pi.getOffset(), pi.getBoardLimit());
		
		// 전달할값 있으면 가운데 null값 대체해놓기..
		ArrayList<Question> qList = (ArrayList)sqlSession.selectList("questionMapper.selectQuestionList", lec_no, new RowBounds(pi.getOffset(), pi.getBoardLimit()));
		
		return qList;
	}
	
	// Mapper에 이미 되어있는거 재사용하자
	public Lecture getLecture(int lec_no) {
		return sqlSession.selectOne("lectureMapper.getLecture",lec_no);
	}
	
	public int qInsert(Question q) {
		return sqlSession.insert("questionMapper.qInsert", q);
	}
	
	public int qFileInsert(QFile qf) {
		return sqlSession.insert("questionMapper.qFileInsert", qf);
	}
	
	// 조회수 증가
	public int updateCount(int q_no) {
		return sqlSession.update("questionMapper.updateCount", q_no);
	}

	public Question selectDetailQuestion(int q_no) {
		return sqlSession.selectOne("questionMapper.selectDetailQuestion", q_no);
	}

	public int qUpdate(Question q) {
		return sqlSession.update("questionMapper.qUpdate", q);
	}
	
	public int qUpdateFile(QFile qf) {
		return sqlSession.update("questionMapper.qUpdateFile", qf);
	}
	
	public int qDelete(int q_no) {
		return sqlSession.update("questionMapper.qDelete", q_no);
	}

	public int fileDelete(String changename) {
		return sqlSession.delete("questionMapper.fileDelete", changename);
	}

	public int fileoxChange(int q_no) {
		return sqlSession.update("questionMapper.fileoxChange",q_no);
	}

	public int DeleteAfterFileox(int q_no) {
		return sqlSession.update("questionMapper.DeleteAfterFileox", q_no);
	}

	public int qNewInsertFile(QFile qf) {
		return sqlSession.insert("questionMapper.qNewInsertFile", qf);
	}

	public int qTCInsertReply(Question q) {
		return sqlSession.update("questionMapper.qTCInsertReply", q);
	}

	public int qReplyInsert(QReply q) {
		return sqlSession.insert("questionMapper.qReplyInsert", q);
	}

	public ArrayList<QReply> selectQReply(int q_no) {
		ArrayList<QReply> qRList = (ArrayList)sqlSession.selectList("questionMapper.selectQRply", q_no);
		return qRList;
	}

	public int qReplyListCount(int q_no) {
		return sqlSession.selectOne("questionMapper.qReplyListCount", q_no);
	}

	public Question selectTeacherName(int lec_no) {
		return sqlSession.selectOne("questionMapper.selectTeacherName", lec_no);
	}

	public int deleteDatReply(QReply qr) {
		return sqlSession.update("questionMapper.deleteDatReply", qr);
	}

	public ArrayList<Question> realTimeSelect(int lec_no) {
		ArrayList<Question> realList = (ArrayList)sqlSession.selectList("questionMapper.realTimeSelect", lec_no);
		return realList;
	}

	public ArrayList<Board> realTimeFreeSelect() {
		ArrayList<Board> realList = (ArrayList)sqlSession.selectList("questionMapper.realTimeFreeSelect");
		return realList;
	}

	public ArrayList<Question> selectQuestionList(PageInfo pi, Question q) {
		
		ArrayList<Question> qList = (ArrayList)sqlSession.selectList("questionMapper.selectQuestionSearchList", q, new RowBounds(pi.getOffset(), pi.getBoardLimit()));
		
		return qList;
	}

	public int searchListCount(Question q) {
		return sqlSession.selectOne("questionMapper.searchListCount", q);
	}

	public ArrayList<Question> selecttest(int lec_no) {
		return (ArrayList)sqlSession.selectList("questionMapper.selecttest", lec_no);
	}
	
	// 테스트
	public ArrayList<Question> selectQuestionList(Question q) {
		ArrayList<Question> qList = (ArrayList)sqlSession.selectList("questionMapper.selectQuestionSearchList", q);
		return qList;
	}

	/*
	 * public int selectQ(QFile qf) { return
	 * sqlSession.selectOne("questionMapper.selectQ", qf); }
	 */
	
}
