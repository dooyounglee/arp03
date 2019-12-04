package com.kh.arp.question.model.vo;

import lombok.Data;

@Data
public class QReply {
	// 질문댓글
	private int r_no;		// 댓글번호
	private int lec_no;		// 강의번호
	private int q_no;		// 게시글번호
	private int m_no;		// 회원번호
	private String content;	// 내용
	private String regdate;	// 작성일자
	private String updatedate;	// 수정일자
	private String status;	// 상태
	private String name;	// 이름 - 필요하여 필드명 추가
}
