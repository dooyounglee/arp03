package com.kh.arp.question.model.service;

import java.util.ArrayList;

import com.kh.arp.common.PageInfo;
import com.kh.arp.question.model.vo.Question;

public interface QService {

	
	// 게시판 총 갯수 조회 서비스
	int getListCount();
	
	// 게시글 전체리스트 조회
	ArrayList<Question> selectQuestionList(PageInfo pi);
	
	
}
