package com.kh.arp.question.model.vo;

import lombok.Data;

@Data
public class QFile {
	// 질문게시판 파일업로드
	private int file_no;		// 파일 번호
	private int q_no;			// 질문 번호
	private String originalName;// 파일 원본명
	private String reName;		// 파일 수정명

}
