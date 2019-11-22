package com.kh.arp.manager.model.vo;

import lombok.Data;

@Data
public class CompleteSurvey {

	private int su_no;
	private int m_no;					// 학생 넘버
	private String a1;
	private String a2;
	private String a3;
	private String name;
	private String issurvey;			// 학생이 이 설문을 완료했는지 아는 컬럼
}
