package com.kh.arp.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.board.model.vo.BoardFile;
import com.kh.arp.common.PageInfo;

@Repository("tbDao")
public class TBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Board> selectTBoardList(PageInfo pi){
		int offset =pi.getOffset();
		int boardLimit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		return (ArrayList)sqlSession.selectList("tboardMapper.selectTBoardList",null,rowBounds);
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
	
	public int deleteTBoard(int b_no) {
		return sqlSession.update("tboardMapper.deleteTBoard",b_no);
	}
	
	public int insertTBoardFile(BoardFile bf) {
		return sqlSession.insert("tboardMapper.insertTBoardFile",bf);
	}
	
	public ArrayList<BoardFile> detailTBoardFile(int b_no) {
		return (ArrayList)sqlSession.selectList("tboardMapper.detailTBoardFile",b_no);
	}
	
	public ArrayList<BoardFile> updateTBoardFile(int b_no) {
		return (ArrayList)sqlSession.selectList("tboardMapper.detailTBoardFile",b_no);
	}
	
	public int updateFile(BoardFile bf) {
		System.out.println("dao"+bf);
		return sqlSession.update("tboardMapper.updateFile",bf);
	}
	
	public int updateInsertFile(BoardFile bf) {
		 
		return sqlSession.insert("tboardMapper.updateInsertFile",bf);
	}
	
	public int getListCount() {
		return sqlSession.selectOne("tboardMapper.getListCount");
	}
	
	public int selectRcount(int b_no) {
		System.out.println("다오에서 실행중");
		return sqlSession.update("tboardMapper.selectRcount",b_no);
		
	}
	 
	public int updateStatus(int b_no) {
		return sqlSession.update("tboardMapper.updateStatus",b_no);
	}
	
	public ArrayList<BoardFile> deleteBoardFile(int b_no) {
		return (ArrayList)sqlSession.selectList("tboardMapper.deleteBoardFile",b_no);
	}
	
	public int updateFileDelete(String rename) {
		return sqlSession.delete("tboardMapper.updateFileDelete",rename);
	}
	
	public int updateFileStatus(int b_no) {
		return sqlSession.update("tboardMapper.updateFileStatus",b_no);
	}
	
	public int insertReplyT(BReply r) {
		return sqlSession.insert("tboardMapper.insertReplyT",r);
	}
	
	public ArrayList<BReply> selectReplyList(int b_no){
		return (ArrayList)sqlSession.selectList("tboardMapper.selectReplyList",b_no);
	}
	
	public int tbReplyUpdate(BReply r) {
		return sqlSession.update("tboardMapper.tbReplyUpdate",r);
	}
	
	public int reReplyInsert(BReply r) {
		return sqlSession.insert("tboardMapper.reReplyInsert",r);
	}
	
	public int recountUpdate(BReply r) {
		return sqlSession.update("tboardMapper.recountUpdate",r);
	}
	
	public int deleteRe(BReply r) {
		return sqlSession.update("tboardMapper.deleteRe",r);
	}
	
	public int re_countMinus(BReply r) {
		return sqlSession.update("tboardMapper.re_countMinus",r);
	}
	
	public int upInsertTBoardFile(BoardFile bf) {
		return sqlSession.insert("tboardMapper.upInsertTBoardFile",bf);
	}
}
