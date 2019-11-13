package com.kh.arp.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.board.model.dao.BoardDao;
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

}