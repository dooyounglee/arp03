package com.kh.arp.lecture.model.vo;

import lombok.Data;

@Data
public class Lecture {

	private int lec_no;
	private int m_no;
	private String title;
	private String startdate;
	private String starttime;
	private int inghour;
	private String status;
	private String content;
	private String updatecomment;
	private int headcount;
	private int ingcount;
	private int nth;
	private String dayofweek;
	private String place;
	private String name;
	private int cnt;
}
