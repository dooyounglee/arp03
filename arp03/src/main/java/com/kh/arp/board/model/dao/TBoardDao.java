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

}
