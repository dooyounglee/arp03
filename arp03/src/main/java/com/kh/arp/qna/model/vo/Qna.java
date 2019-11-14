package com.kh.arp.qna.model.vo;

import lombok.Data;

@Data
public class Qna {

	private int qna_no;
	private int m_no;
	private String title;
	private String content;
	private String answer;
	private String questiondate;
	private String answerdate;
	private String status;
}
