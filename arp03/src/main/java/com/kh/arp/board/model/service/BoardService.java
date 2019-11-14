package com.kh.arp.board.model.service;

import java.util.ArrayList;

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
	ArrayList<BReply> selectReplyList(int b_no);
	
	int insertReply(BReply r);
	
}
