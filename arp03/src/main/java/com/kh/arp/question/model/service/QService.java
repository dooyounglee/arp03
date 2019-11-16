package com.kh.arp.question.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.arp.common.PageInfo;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.question.model.vo.QFile;
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
	
	// 파일 첨부
	int qFileInsert(QFile qf);
	
	// 상세보기 페이지 조회
	Question selectDetailQuestion(int q_no);
	
	// 글 업데이트
	int qUpdate(Question q);
	
	// 첨부파일 업데이트
	int qUpdateFile(QFile qf);
	
	// 수정 및 삭제하려고하는 게시판 조회용 서비스
	Question qSelectDelete(int q_no);
	
	// 게시판 삭제 서비스
	int qDelete(int q_no);

	
}
