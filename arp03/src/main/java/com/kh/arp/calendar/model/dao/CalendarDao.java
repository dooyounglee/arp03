package com.kh.arp.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.calendar.model.vo.Calendar;

@Repository("cDao")
public class CalendarDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertCalendar(Calendar c) {
		return sqlSession.insert("CalendarMapper.insertCalendar", c);
	}

	public ArrayList<Calendar> selectCalList(int m_no) {
		return (ArrayList) sqlSession.selectList("CalendarMapper.selectCalList", m_no);
	}

	public int updatetCalendar(Calendar c) {
		return sqlSession.update("CalendarMapper.updateCalendar", c);
	}

	public int updateTitle(Calendar c) {
		return sqlSession.update("CalendarMapper.updateTitle", c);
	}

	public int deleteCalendar(Calendar c) {
		return sqlSession.update("CalendarMapper.deleteCalendar", c);
	}

	public int moveCalendar(Calendar c) {
		return sqlSession.update("CalendarMapper.moveCalendar", c);
	}

}
