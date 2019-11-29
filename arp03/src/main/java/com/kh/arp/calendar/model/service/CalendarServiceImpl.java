package com.kh.arp.calendar.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.calendar.model.dao.CalendarDao;
import com.kh.arp.calendar.model.vo.Calendar;

@Service("cService")
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDao cDao;
	
	@Override
	public int insertCalendar(Calendar c) {
		return cDao.insertCalendar(c);
	}

	@Override
	public ArrayList<Calendar> selectCalList(int m_no) {
		return cDao.selectCalList(m_no);
	}

	@Override
	public int updateCalendar(Calendar c) {
		return cDao.updatetCalendar(c);
	}

	@Override
	public int updateTitle(Calendar c) {
		return cDao.updateTitle(c);
	}

	@Override
	public int deleteCalendar(Calendar c) {
		return cDao.deleteCalendar(c);
	}

	@Override
	public int moveCalendar(Calendar c) {
		return cDao.moveCalendar(c);
	}
	
	

}
