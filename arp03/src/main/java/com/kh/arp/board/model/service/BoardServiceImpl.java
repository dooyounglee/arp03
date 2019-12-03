package com.kh.arp.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.board.model.dao.BoardDao;
import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.common.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao bDao;
	
	@Override
	public int listCount() {
		return bDao.getListCount();
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDao.selectList(pi);
	}

	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(b);
	}

	@Override
	public Board selectBoard(int b_no) {
		return bDao.selectBoard(b_no);
	}

	@Override
	public ArrayList<BReply> selectReplyList(int b_no, PageInfo pi) {
		return bDao.selectReplyList(b_no, pi);
	}

	@Override
	public int insertReply(BReply r) {
		return bDao.insertReply(r);
	}
	
	@Override
	public int deleteReply(BReply r) {
		return bDao.deleteReply(r);
	}

	@Override
	public int updateReply(BReply r) {
		return bDao.updateReply(r);
	}

	@Override
	public int insertReReply(BReply r) {
		return bDao.insertReReply(r);
	}

	@Override
	public int replyListCount(int b_no) {
		return bDao.replyListCount(b_no);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(b);
	}

	@Override
	public int deleteBoard(int b_no) {
		return bDao.deleteBoard(b_no);
	}

	@Override
	public int updateVcount(int b_no) {
		return bDao.updateVcount(b_no);
	}

	@Override
	public int searchListCount(HashMap map) {
		return bDao.searchListCount(map);
	}

	@Override
	public ArrayList<Board> searchList(HashMap map, PageInfo pi) {
		return bDao.searchList(map, pi);
	}

}
