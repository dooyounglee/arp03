package com.kh.arp.calendar.model.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class Calendar {
	
	private int c_no;
	private int m_no;
	private String title;
	private Date start;
	private Date end;
	private boolean allDay = false;
	
}
