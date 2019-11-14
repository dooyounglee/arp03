package com.kh.arp.board.model.vo;

import lombok.Data;

@Data
public class Board {
	
	private int b_no;
	private int m_no;
	private int ca_no;
	private String title;
	private String content;
	private String regdate;
	private String update_date;
	private int vcount;
	private String status;
	private int dcount;
	private int rcount;
	private String fileStatus;
	private String name; 			// list 작성자 조인
	private String imageStatus;		// 이미지가 존재하는지 여부
	

}
