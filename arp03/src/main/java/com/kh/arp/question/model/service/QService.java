package com.kh.arp.question.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.arp.board.model.vo.Board;
import com.kh.arp.common.PageInfo;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.question.model.vo.QFile;
import com.kh.arp.question.model.vo.QReply;
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
	
	// 게시글 수정시 파일 삭제 서비스
	int fileDelete(String changename);

	// 파일업로드시 파일유무 변경서비스
	int fileoxChange(int q_no);

	// 파일삭제 후 파일유무 변경서비스
	int DeleteAfterFileox(int q_no);

	// 파일 추가 서비스
	int qNewInsertFile(QFile qf);
	
	// 질문게시판에 답변하기(선생님) 내용 업데이트 서비스
	int qTCInsertReply(Question q);

	// 선생님답변의 댓글
	int qReplyInsert(QReply q);
	
	// 댓글 조회해오기
	ArrayList<QReply> selectQReply(int q_no);

	// 댓글 갯수 조회해오기
	int qReplyListCount(int q_no);
	
	// 선생님 이름 조회
	Question selectTeacherName(int lec_no);
	
	// 대댓글 삭제(선생님댓글에대한 댓글)
	int deleteDatReply(QReply qr);

	// 각 질문게시판 조회수많은 질문 순서 리스트조회
	ArrayList<Question> realTimeSelect(int lec_no);
	
	// 자유게시판 조회수 많은 글 리스트 조회
	ArrayList<Board> realTimeFreeSelect();

	// 검색 게시판
	ArrayList<Question> selectQuestionList(PageInfo pi, Question q);

	// 검색한 게시물 갯수
	int searchListCount(Question q);

	ArrayList<Question> selecttest(int lec_no);

	// 검색 게시판 테스트
	ArrayList<Question> selectQuestionList(Question q);
	
	/*
	 * // QFile 검색 int selectQ(QFile qf);
	 */
	
}
