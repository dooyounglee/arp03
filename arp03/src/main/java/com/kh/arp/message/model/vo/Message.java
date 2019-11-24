package com.kh.arp.message.model.vo;

import com.kh.arp.member.model.vo.Member;

import lombok.Data;

@Data
public class Message {
	
	private int ms_no;				// 메시지번호
	private int g_no;				// 수신자
	private int s_no;				// 발신자
	private String title;			// 제목
	private String content;			// 내용
	private String r_date;			// 열람일자 
	private String s_date;			// 발송일자
	

}
