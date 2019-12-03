package com.kh.arp.manager.model.vo;

import lombok.Data;

/**
 * @author nashaQ
 *	설문조사에서 답과 질문을 담는 vo
 */
@Data
public class SurveyQuestion {

	private int sq_no;			// 질문 순서번호
	private int su_no;			// 설문조사 번호
	private int m_no;			// 학생 번호
	private String question;	// 질문
	private String answer;		// 답
	private String name;		// 학생이름
	private String enrolldate;   // 날짜
	private String title;		// 설문조사명
	private String issurvey;	// 설문조사 완료판단 필드
	private String title_1;				// 강의명
}
