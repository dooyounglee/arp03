package com.kh.arp.manager.model.vo;

import lombok.Data;

@Data
public class Survey {

	private int su_no;
	private int lec_no;
	private int m_no;				// 매니저 번호
	private int m_no2;				// 학생 번호
	private String title;
	private String enrolldate;
	private String q1;
	private String a1;
	private String q2;
	private String a2;
	private String q3;
	private String a3;
	private String name;
	private String title_1;
}
