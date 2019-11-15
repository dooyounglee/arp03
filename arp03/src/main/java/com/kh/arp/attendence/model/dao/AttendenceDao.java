package com.kh.arp.attendence.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.arp.attendence.model.vo.Attendence;

public class AttendenceDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Attendence selectStudentAttendence() {
		Attendence at=null; 
		return at;
	}
}
