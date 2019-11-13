package com.kh.arp.FAQ.model.vo;

import lombok.Data;

@Data
public class FAQ {
	private int faq_no;
	private String question;
	private String answer;
	private String category;
	private int m_no;
}
