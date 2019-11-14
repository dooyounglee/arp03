package com.kh.arp.question.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.arp.common.PageInfo;
import com.kh.arp.member.model.vo.Lecture;
import com.kh.arp.question.model.vo.Question;

public interface QService {

	// 강의별 리스트 조회
	List<Lecture> getClassList();
	
	// 게시판 총 갯수 조회 서비스
	int getListCount(int lec_no);
	
	// 게시글 전체리스트 조회
	ArrayList<Question> selectQuestionList(PageInfo pi, int lec_no);
	
	
}
