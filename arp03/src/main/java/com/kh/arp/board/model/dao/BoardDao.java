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

	public ArrayList<BReply> selectReplyList(int b_no, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("boardMapper.selectReplyList", b_no, rowBounds);
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

	public int insertReReply(BReply r) {
		int con = sqlSession.update("boardMapper.updateRecount", r);
		
		int rst = 0;
		if(con > 0) {
			rst = sqlSession.insert("boardMapper.insertReReply", r);
		}
		
		return rst;
	}

	public int replyListCount(int b_no) {
		return sqlSession.selectOne("boardMapper.replyListCount", b_no);
	}

	public int updateBoard(Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int deleteBoard(int b_no) {
		return sqlSession.update("boardMapper.deleteBoard", b_no);
	}

	public int updateVcount(int b_no) {
		return sqlSession.update("boardMapper.updateVcount", b_no);
	}
	
}