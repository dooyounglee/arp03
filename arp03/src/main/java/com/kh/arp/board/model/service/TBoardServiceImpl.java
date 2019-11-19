package com.kh.arp.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.board.model.dao.TBoardDao;
import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.board.model.vo.BoardFile;
import com.kh.arp.common.PageInfo;

@Service("tbService")
public class TBoardServiceImpl implements TBoardService{
	
	@Autowired
	private TBoardDao tbDao;

	@Override
	public ArrayList<Board> selectTBoardList(PageInfo pi) {
		
		return tbDao.selectTBoardList(pi);
	}

	@Override
	public int insertTBoard(Board b) {
		
		return tbDao.insertTBoard(b);
	}

	@Override
	public Board detailTBoard(int b_no) {

		return tbDao.detailTBoard(b_no);
	}

	@Override
	public Board updateTBoardForm(int b_no) {
		
		return tbDao.updateTBoardForm(b_no);
	}

	@Override
	public int updateTBoard(Board b) {
		
		return tbDao.updateTBoard(b);
	}

	@Override
	public int deleteTBoard(int b_no) {

		return tbDao.deleteTBoard(b_no);
	}

	@Override
	public int insertTBoardFile(BoardFile bf) {

		return tbDao.insertTBoardFile(bf);
	}

	@Override
	public ArrayList<BoardFile> detailTBoardFile(int b_no) {
	
		return tbDao.detailTBoardFile(b_no);
	}

	@Override
	public ArrayList<BoardFile> updateTBoardFile(int b_no) {
		return tbDao.updateTBoardFile(b_no);
	}

	@Override
	public int updateFile(BoardFile bf) {
		
		return tbDao.updateFile(bf);
	}

	@Override
	public int updateInsertFile(BoardFile bf) {

		return tbDao.updateInsertFile(bf);
	}

	@Override
	public int getListCount() {
		
		return tbDao.getListCount();
	}

	@Override
	public int selectRcount(int b_no) {

		return tbDao.selectRcount(b_no);
	}

	@Override
	public int updateStatus(int b_no) {
		
		return tbDao.updateStatus(b_no);
	}

	@Override
	public ArrayList<BoardFile> deleteBoardFile(int b_no) {

		return tbDao.deleteBoardFile(b_no);
	}
	
	public int updateFileDelete(String rename) {
		return tbDao.updateFileDelete(rename);
	}
 
	@Override
	public int updateFileStatus(int b_no) {
		
		return tbDao.updateFileStatus(b_no);
	}

	@Override
	public int insertReplyT(BReply r) {
		
		return tbDao.insertReplyT(r);
	}

	@Override
	public ArrayList<BReply> selectReplyList(int b_no) {

		return tbDao.selectReplyList(b_no);
	}

	@Override
	public int tbReplyUpdate(BReply r) {

		return tbDao.tbReplyUpdate(r);
	}

}
