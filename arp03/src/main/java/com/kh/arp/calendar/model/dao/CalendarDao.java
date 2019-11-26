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

}
