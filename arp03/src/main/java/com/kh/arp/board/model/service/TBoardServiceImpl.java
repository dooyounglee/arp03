package com.kh.arp.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.board.model.dao.TBoardDao;
import com.kh.arp.board.model.vo.Board;

@Service("tbService")
public class TBoardServiceImpl implements TBoardService{
	
	@Autowired
	private TBoardDao tbDao;

	@Override
	public ArrayList<Board> selectTBoardList() {
		
		return tbDao.selectTBoardList();
	}

}
