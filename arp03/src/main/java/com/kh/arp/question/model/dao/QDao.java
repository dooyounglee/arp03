package com.kh.arp.question.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.common.PageInfo;
import com.kh.arp.question.model.vo.Question;

@Repository("qDao")
public class QDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		
		return sqlSession.selectOne("questionMapper.getListCount");
	}

	public ArrayList<Question> selectQuestionList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		// 전달할값 있으면 가운데 null값 대체해놓기..
		ArrayList<Question> qList = (ArrayList)sqlSession.selectList("questionMapper.selectQuestionList", null, rowBounds);
		
		return qList;
	}
	
}
