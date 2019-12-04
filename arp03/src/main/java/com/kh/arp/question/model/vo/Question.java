package com.kh.arp.question.model.vo;

import lombok.Data;

@Data
public class Question {
	// 질문게시판
	private int q_no;				// 질문번호
	private int lec_no;				// 강의번호
	private int m_no;				// 회원번호
	private String title;			// 제목
	private String content;			// 내용
	private String regdate;			// 작성일자
	private String updatedate;		// 수정일자
	private String status;			// 상태
	private int vcount;				// 조회수
	private int dcount;				// 신고수
	private int rcount;				// 댓글수
	private String isreply;			// 답변여부
	private String replydate;		// 답변날짜
	private String replycontent;	// 답변내용
	private String isdelete;		// 삭제여부
	private String name;			// 학생이름  - 필요하여 필드명 추가
	private String fileox;			// 첨부파일여부
	private String originalname;	// 원본명 - 필요하여 필드명 추가
	private String changename;		// 수정명 - 필요하여 필드명 추가
	private String tcname;			// 선생님이름 - 필요하여 필드명 추가
	private String youtubelink;		// url주소
	private String searchSelectContent; // 검색입력 내용 - 필요하여 필드명 추가
	private String Category1;			// 검색 카테고리 분류 - 필요하여 필드명 추가
}
