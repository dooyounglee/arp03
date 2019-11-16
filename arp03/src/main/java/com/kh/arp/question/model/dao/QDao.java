package com.kh.arp.question.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.common.PageInfo;
import com.kh.arp.member.model.vo.Lecture;
import com.kh.arp.question.model.vo.QFile;
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
	

	/*
	 * public ArrayList<Question> selectQuestionList2(Question q) {
	 * ArrayList<Question> qList2 =
	 * (ArrayList)sqlSession.selectList("questionMapper.selectQuestionList2", q);
	 * 
	 * return qList2;
	 * 
	 * }
	 */
	
	// 조회수 증가
	public int updateCount(int q_no) {
		return sqlSession.update("questionMapper.updateCount", q_no);
	}

	public Question selectDetailQuestion(int q_no) {
		return sqlSession.selectOne("questionMapper.selectDetailQuestion", q_no);
	}

	/*
	 * public int qUpdate(int q_no) { // TODO Auto-generated method stub return
	 * sqlSession.update("questionMapper.qUpdateForm", q_no); }
	 */

	public int qUpdate(Question q) {
		return sqlSession.update("questionMapper.qUpdate", q);
	}

	public int qDelete(int q_no) {
		return sqlSession.update("questionMapper.qDelete", q_no);
	}


	
	
}
