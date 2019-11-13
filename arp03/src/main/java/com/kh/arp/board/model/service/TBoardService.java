package com.kh.arp.board.model.service;

import java.util.ArrayList;

import com.kh.arp.board.model.vo.Board;


public interface TBoardService {
	
	// 1. 선생님 게시판 리스트용 서비스
	ArrayList<Board> selectTBoardList();
	
	// 2. 선생님 게시판 글 작성용 서비스 
	int insertTBoard(Board b);
	
	// 3. 선생님 게시판  글 상세보기용 서비스
	Board detailTBoard(int b_no);
	
	//4. 선생님 게시판 글 수정용 서비스
	Board updateTBoardForm(int b_no);
	
	// 5. 선생님 게시판 글 수정용 서비스
	int updateTBoard(Board b);

}
