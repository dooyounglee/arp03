package com.kh.arp.manager.model.vo;

import lombok.Data;

@Data
public class CompleteSurvey {

	private int su_no;
	private int m_no;					// 학생 넘버
	private int sq_no;
	private String answer;
	private String name;				// 학생이름
}
