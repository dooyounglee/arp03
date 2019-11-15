package com.kh.arp.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.common.PageInfo;

@Repository("bDao")
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() { 
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		// currentPage 1 > offset 0
		// currentPage 2 > offset 5
		// currentPage 3 > offset 10
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}

	public int insertBoard(Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public Board selectBoard(int b_no) {
		return sqlSession.selectOne("boardMapper.selectBoard", b_no);
	}

	public ArrayList<BReply> selectReplyList(int b_no) {
		return (ArrayList) sqlSession.selectList("boardMapper.selectReplyList", b_no);
	}

	public int insertReply(BReply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public int deleteReply(int r_no) {
		return sqlSession.update("boardMapper.deleteReply", r_no);
	}

	public int updateReply(BReply r) {
		return sqlSession.update("boardMapper.updateReply", r);
	}
	
}
