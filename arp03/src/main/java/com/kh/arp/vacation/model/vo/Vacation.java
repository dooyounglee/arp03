package com.kh.arp.vacation.model.vo;

import lombok.Data;

@Data
public class Vacation {

	private int v_no;
	private int m_no;
	private int lec_no;
	private String reason;
	private String start_date;
	private String start_count; // 휴가일수
	private int date_count;
	private String application_date;
	private String tstatus;
	private String mstatus;
	private String status;
	private String title;
	private String name;
}
