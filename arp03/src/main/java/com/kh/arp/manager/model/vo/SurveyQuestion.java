package com.kh.arp.manager.model.vo;

import lombok.Data;

@Data
public class SurveyQuestion {

	private int sq_no;			// 질문 순서번호
	private int su_no;			// 설문조사 번호
	private int m_no;			// 학생 번호
	private String question;	// 질문
	private String answer;		// 답
	private String name;		// 학생이름
	private String enrolldate;   // 날짜
	private String title;
}