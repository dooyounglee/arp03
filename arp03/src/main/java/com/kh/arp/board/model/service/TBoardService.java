package com.kh.arp.board.model.service;

import java.lang.reflect.Array;
import java.util.ArrayList;

import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.board.model.vo.BoardFile;
import com.kh.arp.common.PageInfo;


public interface TBoardService {
	
	// 1. 선생님 게시판 리스트용 서비스
	ArrayList<Board> selectTBoardList(PageInfo pi);
	
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
	ArrayList<BoardFile> detailTBoardFile(int b_no);
	
	// 9. 선생님 게시판 파일 수정폼용 서비스 
	ArrayList<BoardFile> updateTBoardFile(int b_no);
	
	// 10. 선생님 게시판 파일 수정용 서비스
	int updateFile(BoardFile bf);
	
	// 11.선생님 게시판 수정시 새로운 파일 저장용 서비스 
	int updateInsertFile(BoardFile bf);
	
	// 12. 선생님 게시판 총 갯수 조회용 서비스 
	int getListCount();
	
	// 13. 선생님 게시판 조회수 증가용 서비스 
	int selectRcount(int b_no);
	
	// 14. 게시판 글 수정할때 상태값 수정
	int updateStatus(int b_no);

	// 15. 게시판 글 삭제 했을때 업로드 되어있는 파일도 삭제되는 서비스 
	ArrayList<BoardFile> deleteBoardFile(int b_no);
	
	// 16. 게시글 수정시 파일업로드 삭제시 디비 삭제용 서비스 
	int updateFileDelete(String rename);
	
	// 17. 게시글 첨부파일 지우고 수정완료시 첨부파일 상태 변경용 서비스 
	int updateFileStatus(int b_no);
	
	// ---------- 댓글용 서비스 -----------
	
	// 18 .선생님 게시판 댓글용 서비스 
	int insertReplyT(BReply r);
	
	// 19. 선생님 게시판 댓글 리스트용 서비스 
	ArrayList<BReply> selectReplyList(int b_no);

	// 20. 선생님 게시판 댓글 수정용 서비스 
	int tbReplyUpdate(BReply r);
}
