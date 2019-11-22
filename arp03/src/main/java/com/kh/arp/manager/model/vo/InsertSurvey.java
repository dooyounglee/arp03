package com.kh.arp.manager.model.vo;

import lombok.Data;

@Data
public class InsertSurvey {

	private int su_no;
	private int lec_no;
	private int m_no;				// 매니저 번호
	private String title;			// 설문조사제목
	private String enrolldate;
	private String q1;
	private String q2;
	private String q3;
	private String name;			
	private String title_1;				// 강의명
}
