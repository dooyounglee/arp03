package com.kh.arp.board.model.service;

import java.util.ArrayList;

import com.kh.arp.board.model.vo.Board;


public interface TBoardService {
	
	// 1. 선생님 게시판 리스트용 서비스
	ArrayList<Board> selectTBoardList();

}
