package com.kh.arp.board.model.service;

import java.util.ArrayList;

import com.kh.arp.board.model.vo.Board;
import com.kh.arp.board.model.vo.BoardFile;


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
	
	// 6. 선생님 게시판 글 삭제용 서비스
	int deleteTBoard(int b_no);
	
	// 7. 선생님 게시판 파일 업로드용 서비스 
	int insertTBoardFile(BoardFile bf);
	
	// 8. 선생님 게시판 글 상세보기 파일용 서비스 
	BoardFile detailTBoardFile(int b_no);
	
	// 9. 선생님 게시판 파일 수정폼용 서비스 
	BoardFile updateTBoardFile(int b_no);
	
	// 10. 선생님 게시판 파일 수정용 서비스
	int updateFile(BoardFile bf);
	
	// 11.선생님 게시판 수정시 새로운 파일 저장용 서비스 
	int updateInsertFile(BoardFile bf);
	

}
