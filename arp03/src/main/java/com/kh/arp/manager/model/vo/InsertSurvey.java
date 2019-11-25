package com.kh.arp.manager.model.vo;

import lombok.Data;

@Data
public class InsertSurvey {

	private int su_no;
	private int lec_no;
	private int m_no;				// 선생님 번호
	private String title;			// 설문조사제목
	private String enrolldate;
	private String name;			// 선생님 이름
	private String title_1;				// 강의명
}
