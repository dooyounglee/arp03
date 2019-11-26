package com.kh.arp.calendar.model.service;

import java.util.ArrayList;

import com.kh.arp.calendar.model.vo.Calendar;

public interface CalendarService {
	
	// 일정 추가
	int insertCalendar(Calendar c);

	// 일정 리스트 조회
	ArrayList<Calendar> selectCalList(int m_no);
	
}
