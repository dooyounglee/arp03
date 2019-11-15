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
	
	// lec_no에맞는 Lecture 객체 조회하자
	Lecture getLecture(int lec_no);
	
	// 게시판글 추가
	int qInsert(Question q);

	// 추가한 후에 조회해오는 리스트
	ArrayList<Question> selectQuestionList2(Question q);
	
	// 상세보기 페이지 조회
	Question selectDetailQuestion(int q_no);

	int qUpdate(Question q);
	
	
}
