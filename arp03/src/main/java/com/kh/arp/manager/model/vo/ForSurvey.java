package com.kh.arp.manager.model.vo;

import java.util.List;

import lombok.Data;

/**
 * @author nashaQ
 *	각 변수들을 리스트(배열)로 담아 향상된 포문으로 나누기 위한 vo
 */
@Data
public class ForSurvey {
	private List sq_no;			// 질문 순서번호
	private int su_no;			// 설문조사 번호
	private List question;	// 질문
	private List answer;
}
