package com.kh.arp.question.model.vo;

import lombok.Data;

@Data
public class QReply {
	// 질문댓글
	private int r_no;		// 댓글번호
	private int lec_no;		// 강의번호
	private int b_no;		// 게시글번호
	private int m_no;		// 회원번호
	private String content;	// 내용
	private String regdate;	// 작성일자
	private String update;	// 수정일자
	private String status;	// 상태
}
