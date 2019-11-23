package com.kh.arp.board.model.vo;

import lombok.Data;

@Data
public class BReply {
	
	private int r_no;
	private int b_no;
	private int m_no;
	private String content;
	private String regdate;
	private String update_date;
	private String status;
	private int depth;
	private int parent_no;
	private  String name;

}
