package com.kh.arp.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.arp.board.model.vo.BCategory;
import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.common.PageInfo;

public interface BoardService {
	
	// 게시판 총 글 갯수
	int listCount();
	
	// 게시판 리스트 조회
	ArrayList<Board> selectList(PageInfo pi);
	
	// 게시판 글쓰기
	int insertBoard(Board b); 

	// 게시판 상세 조회
	Board selectBoard(int b_no);
	
	// 댓글 리스트 조회
	ArrayList<BReply> selectReplyList(int b_no, PageInfo pi);
	
	// 댓글 작성
	int insertReply(BReply r);
		
	// 댓글 삭제
	int deleteReply(BReply r);
		
	// 댓글 수정
	int updateReply(BReply r);
	
	// 대댓 작성
	int insertReReply(BReply r);
	
	// 댓글 수 카운트
	int replyListCount(int b_no);
	
	// 게시글 수정
	int updateBoard(Board b);
	
	// 게시글 삭제
	int deleteBoard(int b_no);
	
	// 게시글 뷰카운트 증가
	int updateVcount(int b_no);
	
	// 게시글 검색 갯수
	int searchListCount(HashMap map);
	
	// 게시글 검색 목록
	ArrayList<Board> searchList(HashMap map, PageInfo pi);
	
	
}
