package com.kh.arp.question.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.common.PageInfo;
import com.kh.arp.member.model.vo.Lecture;
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
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		// 전달할값 있으면 가운데 null값 대체해놓기..
		ArrayList<Question> qList = (ArrayList)sqlSession.selectList("questionMapper.selectQuestionList", lec_no, rowBounds);
		
		return qList;
	}
	
	// Mapper에 이미 되어있는거 재사용하자
	public Lecture getLecture(int lec_no) {
		return sqlSession.selectOne("lectureMapper.getLecture",lec_no);
	}

	
	
}
