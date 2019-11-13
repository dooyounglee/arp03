package com.kh.arp.notice.model.vo;

import lombok.Data;

@Data
public class Notice {
	
	private int n_no;
	private int m_no;
	private String title;
	private String content;
	private String regdate;
	private int vcount;

}
