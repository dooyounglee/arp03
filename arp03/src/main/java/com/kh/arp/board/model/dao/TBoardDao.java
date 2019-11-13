package com.kh.arp.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.board.model.vo.Board;

@Repository("tbDao")
public class TBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Board> selectTBoardList(){
		return (ArrayList)sqlSession.selectList("tboardMapper.selectTBoardList");
	}
	
	public int insertTBoard(Board b) {
	
		return sqlSession.insert("tboardMapper.insertTBoard",b);
	}
	
	public Board detailTBoard(int b_no) {
		return  sqlSession.selectOne("tboardMapper.detailTBoard",b_no);
	}

	public Board updateTBoardForm(int b_no) {
		return sqlSession.selectOne("tboardMapper.updateTBoardForm",b_no);
	}
	
	public int updateTBoard(Board b) {
		return sqlSession.update("tboardMapper.updateTBoard",b);
		
	}
}
