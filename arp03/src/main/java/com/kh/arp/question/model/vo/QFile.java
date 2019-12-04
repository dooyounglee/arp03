package com.kh.arp.question.model.vo;

import lombok.Data;

@Data
public class QFile {
	// 질문게시판 파일첨부
	private int file_no;		// 파일번호
	private int q_no;			// 질문번호
	private String originalName;// 원본명
	private String changeName;	// 수정명

}
