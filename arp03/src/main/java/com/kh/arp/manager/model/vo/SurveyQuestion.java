package com.kh.arp.manager.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class SurveyQuestion {

	private int sq_no;			// 질문 순서번호
	private int su_no;			// 설문조사 번호
	private List question;	// 질문
}
